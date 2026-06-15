import PlaygroundSupport
import MetalKit

guard let device = MTLCreateSystemDefaultDevice() else {
    fatalError("GPU is not supported")
}

let frame = CGRect(x: 0, y: 0, width: 600, height: 600)
let view = MTKView(frame: frame, device: device)
view.clearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 0.8, alpha: 1.0)

let allocator = MTKMeshBufferAllocator(device: device)
let mdlMesh = MDLMesh(
    sphereWithExtent: [0.75, 0.75, 0.75],
//    sphereWithExtent: [0.2, 0.75, 0.2],
    segments: [100, 100],
    inwardNormals: false,
    geometryType: .triangles,
    allocator: allocator
)
let mesh = try MTKMesh(mesh: mdlMesh, device: device)

guard let commandQueue = device.makeCommandQueue() else {
    fatalError("Could not create a cammand queue")
}

let shader = """
#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float4 position [[attribute(0)]];
};

vertex float4 vertex_main(const VertexIn vertex_in [[stage_in]]) {
    return vertex_in.position;
}

fragment float4 fragment_main() {
    return float4(0, 0, 1, 1);
//    return float4(0, 0.4, 0.21, 1);
}
"""

let library = try device.makeLibrary(source: shader, options: nil)
let vertexFunction = library.makeFunction(name: "vertex_main")
let fragmentFunction = library.makeFunction(name: "fragment_main")

let pipelineDescriptor = MTLRenderPipelineDescriptor()
pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
pipelineDescriptor.vertexFunction = vertexFunction
pipelineDescriptor.fragmentFunction = fragmentFunction

pipelineDescriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor)

let pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)


// MARK: - Rendering

// command buffer 생성. GPU에게 실행시킬 명령들을 저장.
guard let commandBuffer = commandQueue.makeCommandBuffer(),
      // 뷰의 render pass descriptor 획득.
      // 이 descriptor는 Attachment라고 불리는 랜더링 목적지의 데이터를 보유
      // 각 Attachment는 데이터를 저장할 텍스쳐, render pass동안 해당 텍스쳐를 유지할지 여부 등의 정보가 필요
      // 이 render pass descriptor는 Render Command Encoder (랜더 명령 인코더)를 생성하는 데 사용됨.
      let renderPassDescriptor = view.currentRenderPassDescriptor,
      // command buffer로부터 render command encoder 획득. 이 때 매개변수로 뷰의 render pass descripter를 사용.
      // 이 render command encoder는 GPU가 각 정점들을 그릴수 있게 보내야하는 모든 필수정보들을 가지고있음.
      let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
else { fatalError() }

renderEncoder.setRenderPipelineState(pipelineState)
renderEncoder.setVertexBuffer(mesh.vertexBuffers[0].buffer, offset: 0, index: 0)

guard let submesh = mesh.submeshes.first else {
    fatalError()
}

renderEncoder.drawIndexedPrimitives(
    type: .triangle,
    indexCount: submesh.indexCount,
    indexType: submesh.indexType,
    indexBuffer: submesh.indexBuffer.buffer,
    indexBufferOffset: 0
)

// You tell the render encoder there are no more draw calls and end the render pass.
renderEncoder.endEncoding()
// You get the drawable from the MTKView. The MTKView is backed by a Core Animation CAMetalLayer and the layer owns a drawable texture which Metal can read and write to.
guard let drawable = view.currentDrawable else {
    fatalError()
}
// You ask the command buffer to present the MTKView’s drawable and commit to the GPU.
commandBuffer.present(drawable)
commandBuffer.commit()

PlaygroundPage.current.liveView = view

# 🚀 metal-graphics-labs

## Metal Graphics Study Log
> 그래픽스 엔지니어를 목표로 하는 Metal API 및 3D 그래픽스 수학 독학 기록 레포지토리입니다.
> 각 주제별 코딩과 실행 결과(인증샷)는 해당 디렉토리 내에 함께 아카이빙합니다.

---

## 👾 단계별 한 줄 요약
- **1단계:** Metal 뼈대 잡기 & 벡터 내적으로 카툰 공 띄우기 ⚽
- **2단계:** 외곽선 따기 & 실시간 그림자 구현하기 👤
- **3단계:** 컴퓨트 셰이더로 파티클 돌리고 최적화하기 ⚡

---

## 🧭 진도 체크리스트 (Study Tracker)

공부가 완료된 주차는 체크박스(`[x]`)로 표시합니다. 자세한 코드와 결과물은 각 디렉토리에서 확인할 수 있습니다.

### 🍏 Metal 기초 & 3D 수학
- [x] **01-Metal-Infrastructure:** Metal 인프라 세팅 (`MTKView`, `CommandQueue`)
- [ ] **02-Vertex-Buffer:** 정점 데이터 GPU 버퍼 전달 (`MTLBuffer`)
- [ ] **03-Hello-Triangle:** MSL 기초와 그라데이션 삼각형 렌더링
- [ ] **04-Refactoring-06:** 6월 코드 리팩토링 및 하드웨어 흐름 정립
- [ ] **05-Matrix-Rotation:** simd 행렬 연산 기반 2D 삼각형 회전 제어
- [ ] **06-WVP-Transformation:** 로컬/월드/뷰/투영 변환 및 3D 큐브 구현
- [ ] **07-Depth-Stencil:** 깊이 버퍼 적용 입체 3D 큐브 완성
- [ ] **08-Refactoring-07:** 7월 공간 변환 변형 및 말하기 백지 훈련
- [ ] **09-Mesh-Instancing:** 3D 구체(Sphere) 메쉬 로드 및 인스턴싱 드로우콜
- [ ] **10-Lambert-Lighting:** 픽셀 셰이더 기반 라이팅 (벡터 내적 연산)
- [ ] **11-Cel-Shading-Basic:** **[★핵심] step 함수 적용 2단계 카툰 공 구현**
- [ ] **12-Argument-Buffers:** Argument Buffers 구조체 전환 및 리소스 바인딩
- [ ] **13-Quarter-Review-01:** 실기기 빌드 테스트 및 1분기 최종 결산

### 🎨 카툰 셰이더 심화
- [ ] **14-Vertex-Outline:** 정점 팽창(Vertex Extrusion) 외곽선 구현
- [ ] **15-Sobel-PostProcessing:** 화면 공간 소벨 필터 후처리 외곽선
- [ ] **16-Stylized-Highlight:** 블린-퐁 변형 카툰 헤어 엔젤링 하이라이트
- [ ] **17-Shadow-Mapping:** 라이트 공간 역변환 기반 실시간 카툰 그림자

### ⚡ GPU 컴퓨트 셰이더 & 최적화
- [ ] **18-Compute-Shader:** Kernel 함수 기반 흩날리는 벚꽃 파티클 병렬 연산
- [ ] **19-Frustrum-Culling:** 6개 평면 방정식 기반 프러스트럼 컬링 최적화

---

## 참고

[Kodeco - Metal by Tutorials](https://www.kodeco.com/books/metal-by-tutorials/v4.0/chapters/vi-introduction)  
[met-materials](https://github.com/kodecocodes/met-materials/tree/editions/4.0)

---

## 💡 나만의 규칙 (완벽주의 강박 방어용)
1. **화면에 뜨면 무조건 Pass다.** 코드가 완벽하지 않거나 수학 공식을 완전히 유도하지 못했어도, 화면에 결과가 나오면 디렉토리에 스크린샷을 넣고 체크박스를 채운다.
2. **진도가 밀려도 상관없다.** 직장 업무와 병행하므로 유연하게 대처한다. 중요한 건 포기하지 않고 디렉토리를 하나씩 늘려가는 것이다.

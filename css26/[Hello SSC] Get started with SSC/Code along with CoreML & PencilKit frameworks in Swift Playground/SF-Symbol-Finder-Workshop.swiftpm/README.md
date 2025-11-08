# 🎨 SF Symbol Finder 워크샵

SF Symbol Finder를 기반으로 만들어진 Swift Playgrounds 프로젝트입니다.
해당 워크샵을 통해 PencilKit, CoreML, CreateML의 기초 지식을 학습할 수 있습니다.

---

## ⚠️ 중요: 빌드 방법

이 프로젝트는 **Swift Playgrounds 앱 형식** (.swiftpm)입니다.

### ✅ 올바른 실행 방법:

**방법 1: Swift Playgrounds 앱 사용 (권장)**
```bash
# Swift Playgrounds 앱으로 열기 (iPad/Mac)
open Workshop.swiftpm
```

**방법 2: Xcode에서 열기**
```bash
# Xcode로 프로젝트 열기
open -a Xcode Workshop.swiftpm

# 그리고 Xcode에서 ▶️ Run 버튼 클릭
```

---

## 📦 프로젝트 구조

```
Workshop.swiftpm/
├── Package.swift                      # Swift Playgrounds 매니페스트
├── App.swift                          # 앱 진입점
├── ContentView.swift                  # 탭 네비게이션
│
├── IntroductionView.swift             # 소개 페이지
│
├── PencilKitWorkshop.swift            # PencilKit 플레이스홀더 (TODO)
├── PencilKitWorkshopView.swift        # PencilKit UI
│
├── CoreMLVisionWorkshop.swift         # CoreML 플레이스홀더 (TODO)
├── CoreMLVisionWorkshopView.swift     # CoreML UI
│
├── CreateMLGuideView.swift            # CreateML 가이드
│
└── README.md                          # 이 파일
```

---

## 📚 학습 내용

### PencilKit 워크샵

**파일**: `PencilKitWorkshop.swift`

```
✅ PKCanvasView 생성 및 SwiftUI 통합
✅ Drawing Tool 커스터마이징
✅ Drawing 데이터 저장/불러오기
✅ 이미지 변환
✅ Delegate 패턴
```

**학습 방법**:
1. Xcode에서 `PencilKitWorkshop.swift` 파일 열기
2. `fatalError("구현 필요")` 찾기
3. 주석의 힌트 참고하여 코드 작성
4. 앱 실행하여 결과 확인

### CoreML + Vision 워크샵

**파일**: `CoreMLVisionWorkshop.swift`

```
✅ MLModel 로드
✅ VNCoreMLModel 생성
✅ VNCoreMLRequest로 이미지 분류
✅ 결과 처리
✅ 이미지 전처리
```

### CreateML 워크샵

**파일**: `CreateMLGuideView.swift`

```
✅ 데이터셋 준비
✅ GUI로 모델 생성
✅ 파라미터 튜닝
✅ 모델 평가
```

---

## 💡 특징

### 깔끔한 블록 주석

```swift
/*━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 MARK: - 1. 기본 Canvas View 구현
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━*/

/*
 TODO: makeUIView 메소드 구현

 요구사항:
 - PKCanvasView를 설정하고 반환

 힌트:
 - canvas.backgroundColor = .white
 */
func makeUIView(context: Context) -> PKCanvasView {
    fatalError("구현 필요")
}
```

### 플레이스홀더 메소드

모든 주요 함수가 `fatalError("구현 필요")`로 표시되어 있습니다. 이 부분을 실제 코드로 교체하면 앱이 작동합니다.

---

## 🔧 문제 해결

### 빌드 에러: "type 'Product' has no member 'iOSApplication'"

**원인**: `swift build` 명령으로 빌드하려고 시도함

**해결**: Xcode에서 프로젝트를 열고 ▶️ Run 버튼 클릭

```bash
open -a Xcode Workshop.swiftpm
```

### 앱이 크래시됨

**원인**: `fatalError("구현 필요")` 부분을 실행함

**해결**: TODO 주석을 참고하여 해당 메소드를 구현하세요

```swift
/* 이 부분을 */
func createPenTool(color: UIColor, width: CGFloat) -> PKInkingTool {
    fatalError("구현 필요")
}

/* 다음과 같이 수정 */
func createPenTool(color: UIColor, width: CGFloat) -> PKInkingTool {
    return PKInkingTool(.pen, color: color, width: width)
}
```

### Canvas가 표시되지 않음

1. `PencilKitWorkshop.swift`에서 `makeUIView` 메소드 구현 확인
2. `PencilKitWorkshopView.swift`에서 TODO 부분 구현 확인

---

## ⚙️ 요구사항

### 필수 환경
- **macOS**: 14.0 이상
- **Xcode**: 15.0 이상
- **iOS**: 17.0 이상 (시뮬레이터 또는 실제 기기)

### 선수 지식
- Swift 기본 문법
- SwiftUI 기초
- UIKit 기본 개념

---

## 🎓 학습 순서
```
1. Swift Playground에서 프로젝트 열기
2. 앱 실행 후 Overview 탭 읽기
3. PencilKitWorkshop.swift 파일 열기
4. TODO 찾아서 모두 구현
5. 앱 재실행하여 결과 확인
6. CoreML, CreateML 순서로 동일하게 진행
```

---

## 📚 참고 자료

### Apple 공식 문서
- [PencilKit](https://developer.apple.com/documentation/pencilkit)
- [Core ML](https://developer.apple.com/documentation/coreml)
- [Vision](https://developer.apple.com/documentation/vision)
- [Create ML](https://developer.apple.com/documentation/createml)

### Swift Playgrounds
- [Swift Playgrounds 앱](https://www.apple.com/swift/playgrounds/)
- [Swift Playgrounds 가이드](https://developer.apple.com/documentation/swift-playgrounds)

---


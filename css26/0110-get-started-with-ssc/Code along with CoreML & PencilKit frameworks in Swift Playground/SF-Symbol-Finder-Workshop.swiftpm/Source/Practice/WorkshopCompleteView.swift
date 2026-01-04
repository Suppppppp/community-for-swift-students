import SwiftUI
import PencilKit
import CoreML
import Vision

struct WorkshopCompleteView: View {

    @State private var results: [ClassificationResult] = []
    @State private var visibleHints: Set<Int> = []

    // Workshop에서 만든 클래스들 사용
    let modelLoader = CoreMLModelLoader()
    let resultProcessor = ResultProcessor()
    let classifier = ImageClassifier()
    let canvasView = PencilKitCanvasView()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                headerSection
                instructionSection
                checklistSection

                Divider()
                implementationGuideSection

                Divider()
                workshopDemoSection
            }
            .padding(50)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("PencilKit + CoreML + Vision")
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("이제 모든 워크샵에서 배운 내용을 하나로 합쳐 완전한 SF Symbol Finder를 만들어봅니다!")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    private var instructionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("📝 실습 가이드")
                .font(.headline)

            Text("• 이 파일(WorkshopCompleteView.swift)의 TODO를 구현하세요.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("• PencilKitWorkshop과 CoreMLVisionWorkshop에서 만든 클래스들을 사용합니다.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("• 모든 TODO를 완성하면 아래 데모가 작동합니다!")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }

    private var checklistSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("체크리스트")
                .font(.headline)

            ChecklistItem(text: "1. PencilKitCanvasView를 화면에 추가")
            ChecklistItem(text: "2. clearDrawing() 메소드 호출")
            ChecklistItem(text: "3. CoreMLModelLoader로 모델 로드")
            ChecklistItem(text: "4. VNCoreMLModel 생성")
            ChecklistItem(text: "5. convertToImage()로 이미지 추출")
            ChecklistItem(text: "6. CIImage로 변환")
            ChecklistItem(text: "7. 분류 요청 생성 및 실행")
            ChecklistItem(text: "8. 결과 정렬 및 UI 업데이트")
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }

    private var implementationGuideSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("📚 단계별 구현 가이드")
                .font(.title2)
                .bold()

            guideCard(
                step: 1,
                title: "PencilKitCanvasView 화면에 추가",
                description: "워크샵에서 만든 Canvas를 사용",
                requirements: [
                    "let canvasView = PencilKitCanvasView() 인스턴스 생성",
                    "body의 ZStack에 canvasView 추가",
                    ".frame(width: 500, height: 500) 설정"
                ],
                hint: "// body 안에서\nZStack {\n    canvasView\n    // ... 버튼들\n}\n.frame(width: 500, height: 500)"
            )

            guideCard(
                step: 2,
                title: "clearDrawing() 메소드 호출",
                description: "CLEAR 버튼으로 Canvas 초기화",
                requirements: [
                    "Button의 action에서 canvasView.clearDrawing() 호출",
                    "results = [] 로 결과도 초기화"
                ],
                hint: "Button(\"CLEAR\") {\n    canvasView.clearDrawing()\n    results = []\n}"
            )

            guideCard(
                step: 3,
                title: "CoreMLModelLoader로 모델 로드",
                description: "SFSymbolClassifier 모델을 MLModel로 로드",
                requirements: [
                    "let mlModel = try modelLoader.loadCoreMLModel()",
                    "CoreMLModelLoader의 loadCoreMLModel() 메소드 사용",
                    "MLModel 타입 반환"
                ],
                hint: "let mlModel = try modelLoader.loadCoreMLModel()"
            )

            guideCard(
                step: 4,
                title: "VNCoreMLModel 생성",
                description: "MLModel을 Vision용으로 변환",
                requirements: [
                    "let visionModel = try modelLoader.createVisionModel(from: mlModel)",
                    "CoreMLModelLoader의 createVisionModel() 메소드 사용"
                ],
                hint: "let visionModel = try modelLoader.createVisionModel(from: mlModel)"
            )

            guideCard(
                step: 5,
                title: "convertToImage()로 이미지 추출",
                description: "Canvas의 Drawing을 UIImage로 변환",
                requirements: [
                    "let uiImage = canvasView.convertToImage()",
                    "PencilKitCanvasView의 convertToImage() 메소드 사용"
                ],
                hint: "let uiImage = canvasView.convertToImage()"
            )

            guideCard(
                step: 6,
                title: "CIImage로 변환",
                description: "UIImage를 Vision이 사용할 수 있는 CIImage로 변환",
                requirements: [
                    "classifier.convertToCIImage(from: uiImage) 호출",
                    "guard let으로 Optional 처리",
                    "변환 실패 시 return"
                ],
                hint: "guard let ciImage = classifier.convertToCIImage(from: uiImage) else {\n    print(\"CIImage 변환 실패\")\n    return\n}"
            )

            guideCard(
                step: 7,
                title: "분류 요청 생성 및 실행",
                description: "ImageClassifier로 분류 요청을 만들고 실행",
                requirements: [
                    "classifier.createRequest(model:completion:) 호출",
                    "completion handler에서 observations 받기",
                    "resultProcessor로 정렬 및 변환",
                    "classifier.performClassification() 실행"
                ],
                hint: "let request = classifier.createRequest(model: visionModel) { observations in\n    let sorted = resultProcessor.sortAndFilter(observations: observations, length: 6)\n    let results = resultProcessor.convertToResults(observations: sorted)\n    DispatchQueue.main.async {\n        self.results = results\n    }\n}\ntry classifier.performClassification(on: ciImage, request: request)"
            )

            guideCard(
                step: 8,
                title: "결과 정렬 및 UI 업데이트",
                description: "ResultProcessor로 결과를 처리하고 화면에 표시",
                requirements: [
                    "resultProcessor.sortAndFilter() 사용",
                    "resultProcessor.convertToResults() 사용",
                    "DispatchQueue.main.async로 UI 업데이트",
                    "@State var results에 할당"
                ],
                hint: "let sortedObservations = resultProcessor.sortAndFilter(\n    observations: observations,\n    length: 6\n)\nlet classificationResults = resultProcessor.convertToResults(\n    observations: sortedObservations\n)\nDispatchQueue.main.async {\n    self.results = classificationResults\n}"
            )
        }
    }

    private func guideCard(step: Int, title: String, description: String, requirements: [String], hint: String) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            StepCard(
                step: step,
                title: title,
                description: description
            )
            VStack(alignment: .leading, spacing: 8) {
                Text("요구사항:")
                    .font(.callout)
                    .fontWeight(.semibold)
                ForEach(requirements, id: \.self) { req in
                    Text("• \(req)")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }

                Button {
                    if visibleHints.contains(step) {
                        visibleHints.remove(step)
                    } else {
                        visibleHints.insert(step)
                    }
                } label: {
                    HStack {
                        Image(systemName: visibleHints.contains(step) ? "eye.slash.fill" : "eye.fill")
                        Text(visibleHints.contains(step) ? "힌트 숨기기" : "힌트 보기")
                    }
                    .font(.caption)
                    .foregroundColor(.blue)
                }
                .padding(.top, 4)

                if visibleHints.contains(step) {
                    Text(hint)
                        .font(.callout)
                        .foregroundColor(.blue)
                        .padding(.top, 2)
                }
            }
            .padding(.leading, 42)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }

    private var workshopDemoSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("🎨 완성된 데모")
                .font(.title2)
                .bold()

            Text("모든 TODO를 구현하면 아래 데모가 동작해요")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack(spacing: 20) {
            // 왼쪽: Canvas (PencilKit)
            ZStack {
                // TODO: - PencilKitWorkshop의 PencilKitCanvasView 사용

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button("CLEAR") {
                            // TODO: PencilKitCanvasView의 clearDrawing() 사용
                            results = []
                        }
                        .buttonStyle(BorderedButtonStyle())

                        Button("SEARCH") {
                            try? classifyDrawing()
                        }
                        .buttonStyle(BorderedProminentButtonStyle())
                    }
                    .padding()
                }
            }
            .frame(width: 500, height: 500)

            // 오른쪽: 결과 (CoreML + Vision)
            if !results.isEmpty {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Results")
                        .font(.title2)
                        .bold()

                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(results) { result in
                                HStack(spacing: 20) {
                                    Image(systemName: result.identifier)
                                        .font(.title)
                                        .frame(width: 40)

                                    Text(result.identifier)
                                        .font(.body)

                                    Spacer()

                                    Text("\(Int(result.confidence))%")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.05))
                                .cornerRadius(8)
                            }
                        }
                    }
                }
                .frame(width: 400)
            } else {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Results")
                        .font(.title2)
                        .bold()

                    Text("그림을 그리고 SEARCH를 눌러주세요")
                        .foregroundColor(.secondary)
                        .frame(width: 400, height: 400)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            }
        }
    }

    // MARK: - CoreMLVisionWorkshop의 클래스들을 사용한 분류
    private func classifyDrawing() throws {
        // TODO: 1. CoreMLModelLoader로 모델 로드
        
        // TODO: 2. CoreMLModelLoader로 VNCoreMLModel 생성
        
        // TODO: 3. PencilKitCanvasView의 convertToImage() 사용
        
        // TODO: 4. ImageClassifier로 CIImage 변환
        
        // TODO: 5. ImageClassifier로 분류 요청 생성
        
        // TODO: 6. ResultProcessor로 결과 정렬 및 필터링
        
        // TODO: 7. ResultProcessor로 ClassificationResult 변환
        
        // TODO: 8. results 업데이트
        
        //  TODO:9. ImageClassifier로 분류 수행
    }
}

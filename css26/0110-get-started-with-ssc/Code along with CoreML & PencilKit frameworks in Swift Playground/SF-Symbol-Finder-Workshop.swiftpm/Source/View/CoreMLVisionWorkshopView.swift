import SwiftUI

struct CoreMLVisionWorkshopView: View {

    @State private var predictions: [ClassificationResult] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                instructionSection
                
                predictionSection
                
                checklistSection
            }
            .padding(50)
        }
        .navigationTitle("CoreML/Vision 워크샵")
    }

    private var instructionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🧠 실습 가이드")
                .font(.headline)

            Text("CoreMLVisionWorkshop.swift 파일을 열어 TODO 주석을 찾아 코드를 작성하세요.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Divider()

            Text("⚠️ 주의사항")
                .font(.headline)
                .foregroundColor(.orange)

            Text("CoreML 모델 (.mlmodel 파일)이 프로젝트에 추가되어 있어야 합니다.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }

    private var predictionSection: some View {
        VStack(spacing: 15) {
            Text("예측 결과")
                .font(.headline)

            if predictions.isEmpty {
                Text("TODO: 이미지 분류 기능을 구현하세요")
                    .foregroundColor(.secondary)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            } else {
                List(predictions) { result in
                    HStack {
                        Text(result.identifier)
                            .font(.body)
                        Spacer()
                        Text("\(Int(result.confidence))%")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                .frame(height: 300)
            }
        }
    }

    private var checklistSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("✅ 체크리스트")
                .font(.headline)

            ChecklistItem(text: "CoreML 모델 로드")
            ChecklistItem(text: "VNCoreMLModel 생성")
            ChecklistItem(text: "VNCoreMLRequest 구현")
            ChecklistItem(text: "이미지 분류 수행")
            ChecklistItem(text: "결과 정렬 및 필터링")
            ChecklistItem(text: "이미지 전처리 구현")
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

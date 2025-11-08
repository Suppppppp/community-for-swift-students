import SwiftUI

struct CreateMLGuideView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                headerSection
                
                methodSection
                
                stepsSection
                
                datasetSection
            }
            .padding(50)
        }
        .navigationTitle("CreateML 가이드")
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("📚 CreateML이란?")
                .font(.headline)

            Text("Xcode에 내장된 머신러닝 모델 생성 도구입니다. 코드 없이 GUI로 모델을 학습할 수 있습니다.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    private var methodSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("🎯 학습 방법")
                .font(.headline)

            MethodCard(
                number: 1,
                title: "CreateML 앱 사용 (권장)",
                description: "GUI로 쉽게 모델 생성",
                icon: "app.dashed"
            )

            MethodCard(
                number: 2,
                title: "Swift 코드 사용",
                description: "프로그래밍 방식으로 모델 학습",
                icon: "chevron.left.forwardslash.chevron.right"
            )
        }
    }

    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("📝 CreateML 앱 사용 단계")
                .font(.headline)

            StepCard(
                step: 1,
                title: "CreateML 앱 실행",
                description: "Xcode → Open Developer Tool → Create ML"
            )

            StepCard(
                step: 2,
                title: "프로젝트 생성",
                description: "Image Classifier 선택"
            )

            StepCard(
                step: 3,
                title: "데이터셋 추가",
                description: "Training Data 폴더 드래그"
            )

            StepCard(
                step: 4,
                title: "파라미터 설정",
                description: "Max Iterations, Augmentation 설정"
            )

            StepCard(
                step: 5,
                title: "학습 시작",
                description: "Train 버튼 클릭"
            )

            StepCard(
                step: 6,
                title: "모델 내보내기",
                description: "Output 탭에서 .mlmodel 저장"
            )
        }
    }

    private var datasetSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("📂 데이터셋 구조")
                .font(.headline)

            VStack(alignment: .leading, spacing: 8) {
                Text("TrainingData/")
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.blue)

                Text("├── class1/")
                    .font(.system(.body, design: .monospaced))
                    .padding(.leading, 20)

                Text("│   ├── image1.jpg")
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.secondary)
                    .padding(.leading, 40)

                Text("│   └── image2.jpg")
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.secondary)
                    .padding(.leading, 40)

                Text("├── class2/")
                    .font(.system(.body, design: .monospaced))
                    .padding(.leading, 20)

                Text("└── class3/")
                    .font(.system(.body, design: .monospaced))
                    .padding(.leading, 20)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)

            Text("권장사항:")
                .font(.subheadline)
                .fontWeight(.semibold)

            VStack(alignment: .leading, spacing: 5) {
                Text("• 각 클래스당 최소 10장, 권장 50-100장")
                Text("• 다양한 각도, 조명, 배경 포함")
                Text("• 이미지 크기 통일 (선택사항)")
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
    }
}

struct MethodCard: View {
    let number: Int
    let title: String
    let description: String
    let icon: String

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.blue)
                .frame(width: 50)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("\(number).")
                        .fontWeight(.bold)
                    Text(title)
                        .fontWeight(.semibold)
                }
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(10)
    }
}

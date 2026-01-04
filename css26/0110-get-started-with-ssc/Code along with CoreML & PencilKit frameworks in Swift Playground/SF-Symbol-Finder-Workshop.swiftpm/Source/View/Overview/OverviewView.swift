import SwiftUI

struct OverviewView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                headerSection
                featuresSection
                instructionsSection
            }
            .padding(50)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Code along with CoreML & PencilKit frameworks")
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Based on PencilKit, CoreML, CreateML")
                .font(.title3)
                .foregroundColor(.secondary)
            
            Image("hello_logo")
        }
    }

    private var featuresSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("이런 것들을 알아봐요")
                .font(.title2)
                .fontWeight(.semibold)

            FeatureRow(
                icon: "pencil.tip",
                title: "PencilKit",
                description: "터치 입력으로 그림 그리기"
            )
            
            FeatureRow(
                icon: "cpu",
                title: "CreateML",
                description: "커스텀 머신러닝 모델 생성"
            )
            
            FeatureRow(
                icon: "brain.head.profile",
                title: "CoreML + Vision",
                description: "머신러닝 모델을 사용한 이미지 분류"
            )
        }
    }

    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("이렇게 진행해요")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("2024년 우승작품인 SF Symbol Finder를 함께 만들어 봅니다.")
                .padding(.bottom)

            StepCard(step: 1, title: "탭 순서대로 워크샵을 진행합니다.")
            StepCard(step: 2, title: "TODO 주석을 찾아 필요한 코드를 작성합니다.")
            StepCard(step: 3, title: "충분히 혼자서도 해결해볼 수 있도록 각 메소드마다 힌트가 첨부되어 있습니다.")
            StepCard(step: 4, title: "순서대로 단계를 따른 후에 앱을 실행하여 결과를 확인할 수 있습니다.")
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

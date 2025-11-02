import SwiftUI

struct OverviewView: View {
    var body: some View {
        HStack {
            VStack(spacing: 100) {
                headerSection
                featuresSection
                instructionsSection
            }
        }
    }

    private var headerSection: some View {
        VStack(spacing: 15) {
            Text("SF Symbol Finder 워크샵")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Based on PencilKit, CoreML, CreateML")
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }

    private var featuresSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("학습 내용")
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

            StepCard(step: 1, title: "탭 순서대로 워크샵을 진행합니다.")
            StepCard(step: 2, title: "TODO 주석을 찾아 필요한 코드를 작성합니다.")
            StepCard(step: 3, title: "각 메소드의 힌트를 참고하면 혼자서도 수행할 수 있습니다.")
            StepCard(step: 4, title: "앱을 실행하여 결과를 확인할 수 있습니다.")
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

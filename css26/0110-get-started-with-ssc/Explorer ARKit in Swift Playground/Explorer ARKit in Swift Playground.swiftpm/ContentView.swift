import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    var body: some View {
        FaceNameARView(name: "Judy")
            .ignoresSafeArea()
            .overlay(alignment: .top) {
                Text("Face Tracking Demo")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
    }
}

struct FaceNameARView: UIViewRepresentable {
    
    let name: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Face Tracking 설정 (TrueDepth 필수)
        let config = ARFaceTrackingConfiguration()
        arView.session.run(config)
        
        // 얼굴 앵커
        let faceAnchor = AnchorEntity(.face)
           
        // 3D 텍스트 생성
        let textMesh = MeshResource.generateText(
            name,
            extrusionDepth: 0.01,
            font: .systemFont(ofSize: 0.08, weight: .bold),
            containerFrame: .zero,
            alignment: .center,
            lineBreakMode: .byWordWrapping
        )
        
        let textMaterial = SimpleMaterial(color: .white, isMetallic: false)
        let nameEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])
        
        // 머리 위 위치로 살짝 이동
        nameEntity.position = [0, 0.1, 0.1]
        nameEntity.components.set(BillboardComponent())
        
        faceAnchor.addChild(nameEntity)
        arView.scene.addAnchor(faceAnchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

import SwiftUI
import PencilKit
import CoreML
import Vision

struct SFSymbolFinderView: View {
    @State private var results = [ClassificationResult]()
    let canvasView = CanvasRepresentingView()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                imageView(name: "Episode ①")
                Divider()
                imageView(name: "Episode ②")
                Divider()
                sfSymbolFinderView
            }
            .padding(50)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("SF Symbol Finder")
    }
    
    private func imageView(name: String) -> some View {
        VStack(alignment: .leading) {
            Text(name)
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: 700)
        }
    }
    
    private var sfSymbolFinderView: some View {
        HStack(spacing: 20) {
            ZStack {
                canvasView
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button("CLEAR") {
                            results = []
                            canvasView.clear()
                        }
                        .buttonStyle(BorderedButtonStyle())
                        Button("SEARCH") {
                            predict()
                        }
                        .buttonStyle(BorderedProminentButtonStyle())
                    }
                    .padding()
                }
            }
            .frame(width: 500, height: 500)
            
            if !results.isEmpty {
                VStack {
                    Text("Results")
                        .font(.title)
                        .bold()
                    ForEach(results, id: \.id) { result in
                        HStack(spacing: 20) {
                            Text(result.identifier)
                            Text("\(result.confidence)")
                        }   
                    }
                    Spacer()
                }
            }
        }
    }
    
    private func predict() {
        let image = canvasView.getImage()
        guard 
            let coreMLModel = try? SFSymbolClassifier(configuration: MLModelConfiguration()),
            let visionModel = try? VNCoreMLModel(for: coreMLModel.model) 
        else {
            return
        }
        let request = VNCoreMLRequest(model: visionModel) { request, error in
            guard error == nil else { return }
            guard let observations = request.results as? [VNClassificationObservation] else { return }
            results = []
            let sortedObservations = observations.sorted(by: { $0.confidence > $1.confidence }).prefix(10)
            sortedObservations.forEach { observation in
                results.append(ClassificationResult(
                    identifier: observation.identifier,
                    confidence: Int(observation.confidence * 100)
                ))
            }
        }

        guard let ciImage = CIImage(image: image) else { return }
        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
}

struct CanvasRepresentingView: UIViewRepresentable {
    
    let canvas = PKCanvasView()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.backgroundColor = .darkGray
        canvas.tool = PKInkingTool(.pencil, color: .black, width: 20)
        return canvas
    }
    
    func updateUIView(_ canvas: PKCanvasView, context: Context) { }
    
    func getImage() -> UIImage {
        return canvas.drawing.image(from: canvas.bounds, scale: 1.0)
    }
    
    func clear() {
        canvas.drawing = PKDrawing()
    }
}

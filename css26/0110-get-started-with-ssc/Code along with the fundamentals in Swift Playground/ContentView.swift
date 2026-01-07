import SwiftUI

struct ContentView: View {
    enum LayoutDirection {
        case vertical
        case horizontal
    }

    @State private var layout: LayoutDirection = .vertical

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // 도형 영역
                Group {
                    if layout == .vertical {
                        VStack(spacing: 16) {
                            shapeLinks
                        }
                        .padding()
                    } else {
                        HStack(spacing: 16) {
                            shapeLinks
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                // 하단 버튼 바
                HStack(spacing: 16) {
                    Button("세로") {
                        layout = .vertical
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(layout == .vertical ? .blue : .gray)

                    Button("가로") {
                        layout = .horizontal
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(layout == .horizontal ? .blue : .gray)
                }
                .padding()
                .background(.thinMaterial)
            }
            .navigationTitle("도형들")
            .navigationDestination(for: DisplayShape.self) { shape in
                ShapeDetailView(shape: shape)
            }
        }
    }

    @ViewBuilder
    private var shapeLinks: some View {
        NavigationLink(value: DisplayShape.circle) {
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
        }
        NavigationLink(value: DisplayShape.rectangle) {
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
        }
        NavigationLink(value: DisplayShape.triangle) {
            Triangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        path.move(to: top)
        path.addLine(to: bottomLeft)
        path.addLine(to: bottomRight)
        path.addLine(to: top)
        return path
    }
}

enum DisplayShape: Hashable {
    case circle
    case rectangle
    case triangle
}
struct ShapeDetailView: View {
    let shape: DisplayShape
    @State private var currentColor: Color = .clear
    @State private var showingColorPicker = false

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            content
                .onTapGesture { showingColorPicker = true }
        }
        .onAppear { setInitialColor() }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingColorPicker) {
            NavigationStack {
                Form {
                    ColorPicker("색상 선택", selection: $currentColor, supportsOpacity: true)
                }
                .navigationTitle("색상 선택")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("완료") { showingColorPicker = false }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch shape {
        case .circle:
            Circle()
                .fill(currentColor)
                .frame(width: 200, height: 200)
        case .rectangle:
            Rectangle()
                .fill(currentColor)
                .frame(width: 200, height: 200)
        case .triangle:
            Triangle()
                .fill(currentColor)
                .frame(width: 200, height: 200)
        }
    }

    private var title: String {
        switch shape {
        case .circle: return "빨간색 동그라미"
        case .rectangle: return "초록색 사각형"
        case .triangle: return "파란색 세모"
        }
    }
    
    private func setInitialColor() {
        switch shape {
        case .circle: currentColor = .red
        case .rectangle: currentColor = .green
        case .triangle: currentColor = .blue
        }
    }
    
    private func cycleColor() {
        // Define a simple sequence of colors to cycle through
        let palette: [Color]
        switch shape {
        case .circle:
            palette = [.red, .orange, .yellow, .pink, .purple]
        case .rectangle:
            palette = [.green, .mint, .teal, .cyan]
        case .triangle:
            palette = [.blue, .indigo, .purple, .black]
        }
        if let index = palette.firstIndex(where: { $0 == currentColor }) {
            let next = (index + 1) % palette.count
            currentColor = palette[next]
        } else {
            currentColor = palette.first ?? .primary
        }
    }
}


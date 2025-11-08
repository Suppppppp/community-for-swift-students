import SwiftUI
import PencilKit

/*
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 MARK: - PencilKit 주요 클래스:
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 
 ┌─────────────────────────────────────────────────────────────────┐
 │ PKCanvasView                                                    │
 │ - 실제 그림을 그리는 뷰                                              │
 │ - drawing: PKDrawing (그림)                                      │
 │ - tool: PKTool (도구)                                            │
 └─────────────────────────────────────────────────────────────────┘
 
 ┌─────────────────────────────────────────────────────────────────┐
 │ PKDrawing                                                       │
 │ - 그림 데이터를 담는 모델                                             │
 │ - image(from:scale:) → UIImage                                  │
 │ - dataRepresentation() → Data                                   │
 └─────────────────────────────────────────────────────────────────┘
 
 ┌─────────────────────────────────────────────────────────────────┐
 │ PKInkingTool                                                    │
 │ - init(.pen / .pencil / .marker, color:, width:)                │
 └─────────────────────────────────────────────────────────────────┘
 
 ┌─────────────────────────────────────────────────────────────────┐
 │ PKEraserTool                                                    │
 │ - .vector: 벡터 방식                                              │
 │ - .bitmap: 비트맵 방식                                             │
 └─────────────────────────────────────────────────────────────────┘
 
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 */


/*━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 MARK: - 1. Canvas View 구현
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━*/

struct PencilKitCanvasView: UIViewRepresentable {
    
    @Binding var drawing: PKDrawing
    let canvas = PKCanvasView()
    
    /*
     TODO: PKCanvasView를 설정하고 반환하는 makeUIView 메소드 구현
     
     요구사항:
     - backgroundColor 설정
     - tool 설정 (PKInkingTool 사용)
     - drawingPolicy 설정
     - PKDrawing 바인딩
     - 설정이 완료된 PKCanvasView 반환
     
     참고
     https://developer.apple.com/documentation/pencilkit/pkcanvasview
     */
    func makeUIView(context: Context) -> PKCanvasView {
        fatalError("구현 필요")
    }
    
    /*
     TODO: updateUIView 메소드 구현
     
     요구사항:
     - Binding된 drawing이 변경되면 canvas 업데이트
     */
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        fatalError("구현 필요")
    }
}


/*━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 MARK: - 2. Drawing Tool 생성
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━*/

struct DrawingToolFactory {
    
    /*
     그림을 그리기 위한 툴을 생성하는 팩토리
     
     참고
     https://developer.apple.com/documentation/pencilkit/pkinkingtool-swift.struct/init(_:color:width:)-2l7v
     */
    
    // TODO: Pen 도구 생성
    static func createPenTool(color: UIColor, width: CGFloat) -> PKInkingTool {
        fatalError("구현 필요")
    }
    
    // TODO: Pencil 도구 생성
    static func createPencilTool(color: UIColor, width: CGFloat) -> PKInkingTool {
        fatalError("구현 필요")
    }
    
    // TODO: Marker 도구 생성
    static func createMarkerTool(color: UIColor, width: CGFloat) -> PKInkingTool {
        fatalError("구현 필요")
    }
    
    /*
     TODO: 지우개 도구 생성
     
     요구사항:
     - PKEraserTool 반환
     - EraserType 지정 (.vector 또는 .bitmap)
     */
    static func createEraserTool(type: PKEraserTool.EraserType) -> PKEraserTool {
        fatalError("구현 필요")
    }
}


/*━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 MARK: - 3. Drawing 데이터 처리
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━*/

class DrawingImageHandler {
    
    /*
     TODO: Drawing을 이미지로 변환
     
     요구사항:
     - PKDrawing을 UIImage로 변환
     */
    func convertToImage(drawing: PKDrawing, bounds: CGRect, scale: CGFloat) -> UIImage {
        fatalError("구현 필요")
    }
    
    /*
     TODO: Drawing 초기화
     
     요구사항:
     - 빈 PKDrawing 반환
     */
    func clearDrawing() -> PKDrawing {
        fatalError("구현 필요")
    }
}


/*━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 MARK: - 4. Canvas Delegate 구현
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━*/

class CanvasDelegate: NSObject, PKCanvasViewDelegate {
    
    var onDrawingChanged: ((PKDrawing) -> Void)?
    
    /*
     TODO: 그리기 변경 감지
     
     요구사항:
     - drawing이 변경되면 클로저 호출
     
     참고
     https://developer.apple.com/documentation/pencilkit/pkcanvasviewdelegate/canvasviewdrawingdidchange(_:)
     */
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        fatalError("구현 필요")
    }
}

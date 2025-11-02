import SwiftUI
import PencilKit

struct PencilKitWorkshopView: View {

    @State private var drawing = PKDrawing()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headerSection
                
                instructionSection
                
                checklistSection
                
                canvasSection
                
                buttonsSection
            }
            .padding(50)
        }
        .navigationTitle("PencilKit 워크샵")
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("📚 PencilKit이란?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("사용자의 손가락을 이용한 터치와 애플펜슬의 입력을 그림으로 캡쳐하여 드로잉 환경을 제공합니다.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    private var instructionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("실습 가이드")
                .font(.headline)

            Text("PencilKitWorkshop.swift 파일을 열어 TODO 주석을 찾아 코드를 작성하세요.")
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
            Text("✅ 체크리스트")
                .font(.headline)
            
            ChecklistItem(text: "PKCanvasView 기본 구현")
            ChecklistItem(text: "Drawing Tool 생성 메소드 구현")
            ChecklistItem(text: "Drawing 이미지 처리 메소드 구현")
            ChecklistItem(text: "Canvas Delegate 구현")
            ChecklistItem(text: "생성한 PKCanvasView를 해당 화면에 추가")
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }

    private var canvasSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Canvas")
                .font(.headline)

            /*
             TODO: Canvas View 추가

             힌트:
             - PencilKitCanvasView(drawing: $drawing)
             - .frame(height: 400)
             - .border(Color.gray, width: 2)
             - .cornerRadius(8)

             ⚠️ 주의: PencilKitWorkshop.swift에서 먼저 구현해야 합니다
             */

            Text("TODO: Canvas를 여기에 추가하세요")
                .foregroundColor(.secondary)
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                        .foregroundColor(.gray)
                )
        }
    }

    private var buttonsSection: some View {
        HStack(spacing: 15) {
            Button {
                drawing = PKDrawing()
            } label: {
                Label("Clear", systemImage: "trash")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)

            Button {
                /* TODO: Drawing 저장 기능 추가 */
            } label: {
                Label("Save", systemImage: "square.and.arrow.down")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
    }
}

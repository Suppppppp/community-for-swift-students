import SwiftUI

struct ContentView: View {

    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    OverviewView()
                } label: {
                    Label("Overview", systemImage: "book")
                }
                
                NavigationLink {
                    PencilKitWorkshopView()
                } label: {
                    Label("Doodle with PencilKit", systemImage: "pencil.tip")
                }
                
                NavigationLink {
                    CoreMLVisionWorkshopView()
                } label: {
                    Label("Think with CoreML", systemImage: "brain.head.profile")
                }
                
                NavigationLink {
                    CreateMLGuideView()
                } label: {
                    Label("CreateML", systemImage: "cpu")
                }
                
                NavigationLink {
                    EmptyView()
                } label: {
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

import SwiftUI
import Combine

struct LayoutDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("Stacks") {
                    VStack {
                        Text("VStack")
                        HStack {
                            Text("HStack Item 1")
                            Text("HStack Item 2")
                        }
                        ZStack {
                            Rectangle()
                                .fill(.blue.opacity(0.2))
                                .frame(height: 50)
                            Text("ZStack Overlay")
                        }
                    }
                    .padding()
                }
                
                GroupBox("Lazy Grids") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                        ForEach(0..<10) { i in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.orange)
                                .frame(height: 50)
                                .overlay(Text("\(i)").foregroundStyle(.white))
                        }
                    }
                }
                
                GroupBox("Scroll View Horizontal") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { i in
                                Circle()
                                    .fill(.purple)
                                    .frame(width: 50, height: 50)
                                    .overlay(Text("\(i)").foregroundStyle(.white))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Layouts")
    }
}

#Preview {
    LayoutDemoView()
}

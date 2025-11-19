import SwiftUI

struct GridDemoView: View {
    @State private var columnCount: Double = 3
    @State private var spacing: Double = 10
    
    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing), count: Int(columnCount))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Preview Area
            VStack {
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: spacing) {
                        ForEach(0..<20) { index in
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.blue.gradient)
                                .frame(height: 50)
                                .overlay {
                                    Text("\(index)")
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                    .padding()
                }
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(height: 300)
            }
            
            // Controls
            Form {
                Section("Layout") {
                    VStack(alignment: .leading) {
                        Text("Columns: \(Int(columnCount))")
                        Slider(value: $columnCount, in: 1...5, step: 1)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Spacing: \(Int(spacing))")
                        Slider(value: $spacing, in: 0...30, step: 1)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    GridDemoView()
}

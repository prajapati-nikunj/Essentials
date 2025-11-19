import SwiftUI

struct TextDemoView: View {
    @State private var text: String = "Hello, SwiftUI!"
    @State private var fontSize: Double = 17
    @State private var fontWeight: Font.Weight = .regular
    @State private var color: Color = .primary
    
    var body: some View {
        VStack(spacing: 20) {
            // Preview Area
            VStack {
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(uiColor: .secondarySystemBackground))
                    
                    Text(text)
                        .font(.system(size: fontSize, weight: fontWeight))
                        .foregroundStyle(color)
                        .padding()
                }
                .frame(height: 150)
            }
            
            // Controls
            Form {
                Section("Content") {
                    TextField("Text", text: $text)
                }
                
                Section("Appearance") {
                    VStack(alignment: .leading) {
                        Text("Font Size: \(Int(fontSize))")
                        Slider(value: $fontSize, in: 10...100, step: 1)
                    }
                    
                    Picker("Font Weight", selection: $fontWeight) {
                        Text("Ultra Light").tag(Font.Weight.ultraLight)
                        Text("Thin").tag(Font.Weight.thin)
                        Text("Light").tag(Font.Weight.light)
                        Text("Regular").tag(Font.Weight.regular)
                        Text("Medium").tag(Font.Weight.medium)
                        Text("Semibold").tag(Font.Weight.semibold)
                        Text("Bold").tag(Font.Weight.bold)
                        Text("Heavy").tag(Font.Weight.heavy)
                        Text("Black").tag(Font.Weight.black)
                    }
                    
                    ColorPicker("Color", selection: $color)
                }
            }
        }
        .padding()
    }
}

#Preview {
    TextDemoView()
}

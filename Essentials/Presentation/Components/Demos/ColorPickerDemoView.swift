import SwiftUI
import Combine

struct ColorPickerDemoView: View {
    @State private var selectedColor: Color = .blue
    @State private var backgroundColor: Color = .purple
    @State private var textColor: Color = .primary
    
    var body: some View {
        Form {
            Section {
                ColorPicker("Choose Color", selection: $selectedColor)
                
                Rectangle()
                    .fill(selectedColor)
                    .frame(height: 100)
                    .cornerRadius(12)
            } header: {
                Text("Basic ColorPicker")
            }
            
            Section {
                ColorPicker("Background", selection: $backgroundColor)
                ColorPicker("Text Color", selection: $textColor)
                
                ZStack {
                    Rectangle()
                        .fill(backgroundColor.gradient)
                    
                    VStack {
                        Text("Preview")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Your custom theme")
                            .font(.subheadline)
                    }
                    .foregroundStyle(textColor)
                }
                .frame(height: 120)
                .cornerRadius(12)
            } header: {
                Text("Theme Preview")
            } footer: {
                Text("Customize background and text colors")
            }
            
            Section {
                ColorPicker("Accent Color", selection: $selectedColor, supportsOpacity: false)
            } header: {
                Text("Without Opacity")
            } footer: {
                Text("Opacity slider disabled")
            }
        }
        .navigationTitle("ColorPicker")
    }
}

#Preview {
    NavigationStack {
        ColorPickerDemoView()
    }
}

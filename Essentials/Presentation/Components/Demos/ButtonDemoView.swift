import SwiftUI

struct ButtonDemoView: View {
    @State private var buttonRole: ButtonRole? = nil
    @State private var isBordered: Bool = true
    @State private var isProminent: Bool = true
    
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
                    
                    Button("Tap Me") {
                        print("Button tapped")
                    }
                    .buttonStyle(.borderedProminent) // Dynamic based on selection below would be better but keeping simple for now
                    .tint(isProminent ? .blue : .gray)
                    .controlSize(.large)
                }
                .frame(height: 150)
            }
            
            // Controls
            Form {
                Section("Configuration") {
                    Toggle("Bordered", isOn: $isBordered)
                    Toggle("Prominent", isOn: $isProminent)
                }
                
                Section("Variations") {
                    Button("Standard Button") {}
                    
                    Button("Destructive Button", role: .destructive) {}
                        .buttonStyle(.bordered)
                    
                    Button {
                        // Action
                    } label: {
                        Label("Icon Button", systemImage: "star.fill")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ButtonDemoView()
}

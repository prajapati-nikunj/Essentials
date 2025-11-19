import SwiftUI

struct AttributedStringDemoView: View {
    var attributedString: AttributedString {
        var string = AttributedString("This is an attributed string with various styles.")
        
        if let range = string.range(of: "attributed string") {
            string[range].foregroundColor = .blue
            string[range].font = .system(size: 20, weight: .bold)
            string[range].underlineStyle = .single
        }
        
        if let range = string.range(of: "various styles") {
            string[range].backgroundColor = .yellow.opacity(0.3)
            string[range].font = .italicSystemFont(ofSize: 18)
        }
        
        return string
    }
    
    var markdownString: AttributedString {
        try! AttributedString(markdown: "**Markdown** is also _supported_ in SwiftUI!")
    }
    
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
                    
                    VStack(spacing: 20) {
                        Text(attributedString)
                            .padding()
                        
                        Text(markdownString)
                            .padding()
                    }
                }
                .frame(height: 200)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AttributedStringDemoView()
}

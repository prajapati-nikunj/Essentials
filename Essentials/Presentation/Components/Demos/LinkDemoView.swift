import SwiftUI

struct LinkDemoView: View {
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
                        Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
                            .font(.title)
                        
                        Link(destination: URL(string: "https://www.swift.org")!) {
                            Label("Visit Swift.org", systemImage: "swift")
                                .font(.headline)
                                .padding()
                                .background(Color.orange)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }
                    }
                }
                .frame(height: 200)
            }
            
            Text("Links open in the default browser.")
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LinkDemoView()
}

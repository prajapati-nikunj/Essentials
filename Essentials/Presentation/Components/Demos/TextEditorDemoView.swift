import SwiftUI
import Combine

struct TextEditorDemoView: View {
    @State private var notes: String = "Enter your notes here..."
    @State private var bio: String = "Tell us about yourself"
    @State private var comment: String = ""
    
    var body: some View {
        Form {
            Section {
                TextEditor(text: $notes)
                    .frame(height: 100)
                
                Text("\(notes.count) characters")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } header: {
                Text("Basic TextEditor")
            }
            
            Section {
                TextEditor(text: $bio)
                    .frame(height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
                    )
                
                HStack {
                    Text("\(bio.count)/500")
                        .font(.caption)
                        .foregroundStyle(bio.count > 500 ? .red : .secondary)
                    Spacer()
                }
            } header: {
                Text("Bio Editor")
            } footer: {
                Text("With character limit indicator")
            }
            
            Section {
                TextEditor(text: $comment)
                    .frame(minHeight: 80)
                
                if !comment.isEmpty {
                    Button("Clear") {
                        comment = ""
                    }
                    .foregroundStyle(.red)
                }
            } header: {
                Text("Comment Box")
            } footer: {
                Text("Common for user comments and feedback")
            }
        }
        .navigationTitle("TextEditor")
    }
}

#Preview {
    NavigationStack {
        TextEditorDemoView()
    }
}

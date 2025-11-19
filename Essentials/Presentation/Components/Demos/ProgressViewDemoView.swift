import SwiftUI
import Combine

struct ProgressViewDemoView: View {
    @State private var progress: Double = 0.5
    @State private var isLoading: Bool = false
    
    var body: some View {
        Form {
            Section {
                ProgressView()
            } header: {
                Text("Indeterminate Progress")
            } footer: {
                Text("Shows activity without specific progress")
            }
            
            Section {
                ProgressView(value: progress)
                
                HStack {
                    Button("-") { progress = max(0, progress - 0.1) }
                    Button("+") { progress = min(1, progress + 0.1) }
                }
                .buttonStyle(.bordered)
                
                Text("\(Int(progress * 100))%")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } header: {
                Text("Determinate Progress")
            }
            
            Section {
                ProgressView("Loading...", value: progress)
                
                ProgressView(value: progress, total: 1.0) {
                    HStack {
                        Text("Downloading...")
                        Spacer()
                        Text("\(Int(progress * 100))%")
                    }
                } currentValueLabel: {
                    Text("\(Int(progress * 100))%")
                }
            }
            header: {
                Text("With Label")
            }
            
            Section {
                if isLoading {
                    HStack {
                        ProgressView()
                        Text("Processing...")
                            .foregroundStyle(.secondary)
                    }
                } else {
                    Button("Start Loading") {
                        isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    }
                }
            } header: {
                Text("Async Operation")
            }
            
            Section {
                ProgressView(value: progress) {
                    HStack {
                        Image(systemName: "arrow.down.circle.fill")
                        Text("Download Progress")
                    }
                } currentValueLabel: {
                    Text("\(Int(progress * 100))%")
                }
                .tint(.blue)
            } header: {
                Text("Custom Styling")
            }
        }
        .navigationTitle("ProgressView")
    }
}

#Preview {
    NavigationStack {
        ProgressViewDemoView()
    }
}

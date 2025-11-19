import SwiftUI
import Combine

struct SliderDemoView: View {
    @State private var value: Double = 50
    @State private var volume: Double = 75
    @State private var brightness: Double = 60
    @State private var temperature: Double = 20
    
    var body: some View {
        Form {
            Section {
                Slider(value: $value, in: 0...100)
                Text("Value: \(Int(value))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } header: {
                Text("Basic Slider")
            }
            
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "speaker.fill")
                            .foregroundStyle(.secondary)
                        Slider(value: $volume, in: 0...100)
                        Image(systemName: "speaker.wave.3.fill")
                            .foregroundStyle(.secondary)
                    }
                    Text("Volume: \(Int(volume))%")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Volume Control")
            }
            
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "sun.min.fill")
                            .foregroundStyle(.orange)
                        Slider(value: $brightness, in: 0...100)
                            .tint(.orange)
                        Image(systemName: "sun.max.fill")
                            .foregroundStyle(.orange)
                    }
                    Text("Brightness: \(Int(brightness))%")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Brightness Control")
            }
            
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Slider(value: $temperature, in: 10...30, step: 0.5)
                    Text("Temperature: \(String(format: "%.1f", temperature))°C")
                        .font(.headline)
                }
            } header: {
                Text("Temperature (with step)")
            } footer: {
                Text("Increments by 0.5 degrees")
            }
        }
        .navigationTitle("Slider")
    }
}

#Preview {
    NavigationStack {
        SliderDemoView()
    }
}

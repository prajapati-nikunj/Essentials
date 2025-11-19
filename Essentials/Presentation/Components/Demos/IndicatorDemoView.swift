import SwiftUI
import Combine

struct IndicatorDemoView: View {
    @State private var progress: Double = 0.5
    @State private var gaugeValue: Double = 75
    
    var body: some View {
        Form {
            Section("ProgressView") {
                ProgressView(value: progress)
                ProgressView("Loading...", value: progress)
                
                HStack {
                    Button("-") { progress = max(0, progress - 0.1) }
                    Button("+") { progress = min(1, progress + 0.1) }
                }
                .buttonStyle(.bordered)
                
                ProgressView()
                    .frame(maxWidth: .infinity)
            }
            
            Section("Gauge") {
                Gauge(value: gaugeValue, in: 0...100) {
                    Text("Speed")
                } currentValueLabel: {
                    Text("\(Int(gaugeValue))")
                }
                .gaugeStyle(.accessoryCircular)
                .frame(maxWidth: .infinity)
                
                Slider(value: $gaugeValue, in: 0...100)
            }
            
            Section("TabView") {
                Text("TabView is best demonstrated at the root level, but here is a mini example:")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                TabView {
                    Text("Tab 1 Content")
                        .tabItem {
                            Label("Tab 1", systemImage: "1.circle")
                        }
                    Text("Tab 2 Content")
                        .tabItem {
                            Label("Tab 2", systemImage: "2.circle")
                        }
                }
                .frame(height: 150)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
        .navigationTitle("Indicators & Nav")
    }
}

#Preview {
    IndicatorDemoView()
}

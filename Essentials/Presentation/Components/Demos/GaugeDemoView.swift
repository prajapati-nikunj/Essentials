import SwiftUI
import Combine

struct GaugeDemoView: View {
    @State private var speed: Double = 75
    @State private var temperature: Double = 22
    @State private var battery: Double = 65
    
    var body: some View {
        Form {
            Section {
                Gauge(value: speed, in: 0...200) {
                    Text("Speed")
                } currentValueLabel: {
                    Text("\(Int(speed))")
                }
                .gaugeStyle(.accessoryCircular)
                
                Slider(value: $speed, in: 0...200)
            } header: {
                Text("Circular Gauge")
            }
            
            Section {
                Gauge(value: temperature, in: 0...40) {
                    Text("Temperature")
                } currentValueLabel: {
                    Text("\(Int(temperature))°")
                }
                .gaugeStyle(.accessoryLinear)
                .tint(.orange)
                
                Slider(value: $temperature, in: 0...40)
            } header: {
                Text("Linear Gauge")
            }
            
            Section {
                Gauge(value: battery, in: 0...100) {
                    Image(systemName: "battery.100")
                } currentValueLabel: {
                    Text("\(Int(battery))%")
                }
                .gaugeStyle(.accessoryCircularCapacity)
                .tint(batteryColor)
                
                Slider(value: $battery, in: 0...100)
            } header: {
                Text("Battery Gauge")
            } footer: {
                Text("Color changes based on battery level")
            }
            
            Section {
                HStack {
                    Spacer()
                    VStack {
                        Gauge(value: speed, in: 0...200) {
                            Text("km/h")
                        } currentValueLabel: {
                            Text("\(Int(speed))")
                                .font(.system(size: 30, weight: .bold))
                        }
                        .gaugeStyle(.accessoryCircular)
                        .scaleEffect(1.5)
                        
                        Text("Speed")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                .padding(.vertical)
            } header: {
                Text("Large Gauge")
            }
        }
        .navigationTitle("Gauge")
    }
    
    private var batteryColor: Color {
        switch battery {
        case 0..<20: return .red
        case 20..<50: return .orange
        default: return .green
        }
    }
}

#Preview {
    NavigationStack {
        GaugeDemoView()
    }
}

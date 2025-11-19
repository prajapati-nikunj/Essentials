import SwiftUI
import Combine

struct ToggleDemoView: View {
    @State private var isOn: Bool = true
    @State private var notifications: Bool = true
    @State private var airplaneMode: Bool = false
    @State private var bluetooth: Bool = true
    @State private var wifi: Bool = true
    
    var body: some View {
        Form {
            Section {
                Toggle("Simple Toggle", isOn: $isOn)
            } header: {
                Text("Basic Toggle")
            }
            
            Section {
                Toggle(isOn: $notifications) {
                    Label("Push Notifications", systemImage: "bell.fill")
                }
                .tint(.orange)
                
                Toggle(isOn: $airplaneMode) {
                    Label("Airplane Mode", systemImage: "airplane")
                }
                .tint(.purple)
                
                Toggle(isOn: $bluetooth) {
                    Label("Bluetooth", systemImage: "antenna.radiowaves.left.and.right")
                }
                .tint(.blue)
                
                Toggle(isOn: $wifi) {
                    Label("Wi-Fi", systemImage: "wifi")
                }
                .tint(.cyan)
            } header: {
                Text("Settings Style")
            } footer: {
                Text("Common pattern in iOS Settings")
            }
            
            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Choose one option:")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    ForEach(NotificationFrequency.allCases, id: \.self) { frequency in
                        Toggle(isOn: binding(for: frequency)) {
                            Text(frequency.rawValue)
                        }
                        .toggleStyle(RadioToggleStyle())
                    }
                }
            } header: {
                Text("Radio Button Style")
            } footer: {
                Text("Custom toggle style for mutually exclusive options")
            }
        }
        .navigationTitle("Toggle")
    }
    
    @State private var selectedFrequency: NotificationFrequency = .daily
    
    private func binding(for frequency: NotificationFrequency) -> Binding<Bool> {
        Binding(
            get: { selectedFrequency == frequency },
            set: { if $0 { selectedFrequency = frequency } }
        )
    }
}

enum NotificationFrequency: String, CaseIterable {
    case realtime = "Real-time"
    case daily = "Daily Digest"
    case weekly = "Weekly Summary"
    case never = "Never"
}

struct RadioToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .strokeBorder(configuration.isOn ? Color.blue : Color.secondary, lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    if configuration.isOn {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10, height: 10)
                    }
                }
                
                configuration.label
                    .foregroundStyle(.primary)
                
                Spacer()
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        ToggleDemoView()
    }
}

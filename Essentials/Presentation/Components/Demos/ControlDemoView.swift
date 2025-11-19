import SwiftUI
import Combine

struct ControlDemoView: View {
    // MARK: - State
    @State private var isNotificationsEnabled: Bool = true
    @State private var isDarkModeEnabled: Bool = false
    @State private var soundEnabled: Bool = true
    @State private var vibrationEnabled: Bool = false
    
    @State private var sliderValue: Double = 50
    @State private var volume: Double = 75
    @State private var brightness: Double = 60
    
    @State private var stepperValue: Int = 1
    @State private var quantity: Int = 0
    
    @State private var selectedColor: Color = .blue
    @State private var themeColor: Color = .purple
    
    @State private var selectedDate: Date = Date()
    @State private var birthDate: Date = Date()
    @State private var meetingTime: Date = Date()
    
    @State private var selectedOption: String = "Daily"
    @State private var selectedSize: ClothingSize = .medium
    @State private var selectedPaymentMethod: PaymentMethod = .creditCard
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            // MARK: - Toggle Styles
            Section {
                Toggle("Push Notifications", isOn: $isNotificationsEnabled)
                
                Toggle("Dark Mode Override", isOn: $isDarkModeEnabled)
                    .toggleStyle(.switch)
                    .tint(.purple)
                
                // Custom Toggle with Label
                Toggle(isOn: $soundEnabled) {
                    Label("Sound Effects", systemImage: "speaker.wave.2.fill")
                }
                
                Toggle(isOn: $vibrationEnabled) {
                    Label("Haptic Feedback", systemImage: "square.grid.3x3.fill")
                }
                
            } header: {
                Text("Toggle Switches")
            } footer: {
                Text("Standard toggle switches for settings. Currently in \(colorScheme == .dark ? "dark" : "light") mode.")
            }
            
            // MARK: - Radio Button Style (Picker with Selection)
            Section {
                Picker("Backup Frequency", selection: $selectedOption) {
                    ForEach(["Daily", "Weekly", "Monthly"], id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.inline)
                
                // Custom Radio Button Style
                VStack(alignment: .leading, spacing: 12) {
                    Text("Clothing Size")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    ForEach(ClothingSize.allCases, id: \.self) { size in
                        RadioButton(
                            title: size.rawValue,
                            isSelected: selectedSize == size
                        ) {
                            selectedSize = size
                        }
                    }
                }
                .padding(.vertical, 4)
                
            } header: {
                Text("Radio Button Selection")
            } footer: {
                Text("Radio button style for mutually exclusive options. Only one can be selected at a time.")
            }
            
            // MARK: - Payment Method Selection
            Section {
                ForEach(PaymentMethod.allCases, id: \.self) { method in
                    PaymentMethodRow(
                        method: method,
                        isSelected: selectedPaymentMethod == method
                    ) {
                        selectedPaymentMethod = method
                    }
                }
            } header: {
                Text("Payment Method (Real-World Example)")
            }
            
            // MARK: - Slider
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
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "sun.min.fill")
                            .foregroundStyle(.secondary)
                        Slider(value: $brightness, in: 0...100)
                        Image(systemName: "sun.max.fill")
                            .foregroundStyle(.secondary)
                    }
                    Text("Brightness: \(Int(brightness))%")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
            } header: {
                Text("Slider Controls")
            }
            
            // MARK: - Stepper
            Section {
                Stepper("Adults: \(stepperValue)", value: $stepperValue, in: 1...10)
                
                HStack {
                    Text("Quantity")
                    Spacer()
                    Stepper("", value: $quantity, in: 0...99)
                    Text("\(quantity)")
                        .font(.headline)
                        .frame(minWidth: 30)
                }
                
            } header: {
                Text("Stepper Controls")
            }
            
            // MARK: - ColorPicker
            Section {
                ColorPicker("App Theme Color", selection: $themeColor)
                
                Rectangle()
                    .fill(themeColor.gradient)
                    .frame(height: 60)
                    .cornerRadius(12)
                    .overlay(
                        Text("Theme Preview")
                            .font(.headline)
                            .foregroundStyle(.white)
                    )
                
            } header: {
                Text("Color Picker")
            }
            
            // MARK: - DatePicker
            Section {
                DatePicker("Birth Date", selection: $birthDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                DatePicker("Meeting Time", selection: $meetingTime, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
                
            } header: {
                Text("Date & Time Pickers")
            }
            
            // MARK: - Picker Styles
            Section {
                Picker("Notification Frequency", selection: $selectedOption) {
                    ForEach(["Daily", "Weekly", "Monthly"], id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.menu)
                
                Picker("View Mode", selection: $selectedOption) {
                    ForEach(["Daily", "Weekly", "Monthly"], id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.segmented)
                
            } header: {
                Text("Picker Styles")
            }
        }
        .navigationTitle("Controls")
    }
}

// MARK: - Radio Button Component
struct RadioButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .strokeBorder(isSelected ? Color.blue : Color.secondary, lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    if isSelected {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10, height: 10)
                    }
                }
                
                Text(title)
                    .foregroundStyle(.primary)
                
                Spacer()
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Payment Method Row
struct PaymentMethodRow: View {
    let method: PaymentMethod
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: method.icon)
                    .font(.title2)
                    .foregroundStyle(isSelected ? .blue : .secondary)
                    .frame(width: 30)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(method.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(method.subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.blue)
                        .font(.title3)
                }
            }
            .padding(.vertical, 4)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Supporting Types
enum ClothingSize: String, CaseIterable {
    case small = "Small (S)"
    case medium = "Medium (M)"
    case large = "Large (L)"
    case extraLarge = "Extra Large (XL)"
}

enum PaymentMethod: CaseIterable {
    case creditCard
    case debitCard
    case paypal
    case applePay
    
    var title: String {
        switch self {
        case .creditCard: return "Credit Card"
        case .debitCard: return "Debit Card"
        case .paypal: return "PayPal"
        case .applePay: return "Apple Pay"
        }
    }
    
    var subtitle: String {
        switch self {
        case .creditCard: return "Visa, Mastercard, Amex"
        case .debitCard: return "Direct from bank account"
        case .paypal: return "Pay with PayPal balance"
        case .applePay: return "Pay with Apple Pay"
        }
    }
    
    var icon: String {
        switch self {
        case .creditCard: return "creditcard.fill"
        case .debitCard: return "banknote.fill"
        case .paypal: return "dollarsign.circle.fill"
        case .applePay: return "applelogo"
        }
    }
}

#Preview {
    NavigationStack {
        ControlDemoView()
    }
}

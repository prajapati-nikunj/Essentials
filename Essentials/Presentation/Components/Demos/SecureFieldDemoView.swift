import SwiftUI
import Combine

struct SecureFieldDemoView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    
    var body: some View {
        Form {
            Section {
                SecureField("Password", text: $password)
                    .textContentType(.password)
            } header: {
                Text("Basic SecureField")
            } footer: {
                Text("Password is hidden by default")
            }
            
            Section {
                HStack {
                    if showPassword {
                        TextField("Password", text: $password)
                            .textContentType(.newPassword)
                    } else {
                        SecureField("Password", text: $password)
                            .textContentType(.newPassword)
                    }
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
                
                HStack {
                    if showConfirmPassword {
                        TextField("Confirm Password", text: $confirmPassword)
                            .textContentType(.newPassword)
                    } else {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textContentType(.newPassword)
                    }
                    
                    Button {
                        showConfirmPassword.toggle()
                    } label: {
                        Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("With Show/Hide Toggle")
            } footer: {
                Text("Tap the eye icon to reveal password")
            }
            
            Section {
                if !password.isEmpty {
                    HStack {
                        Text("Strength:")
                            .font(.caption)
                        PasswordStrengthIndicator(password: password)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        PasswordRequirement(text: "At least 8 characters", isMet: password.count >= 8)
                        PasswordRequirement(text: "Contains uppercase", isMet: password.contains(where: { $0.isUppercase }))
                        PasswordRequirement(text: "Contains lowercase", isMet: password.contains(where: { $0.isLowercase }))
                        PasswordRequirement(text: "Contains number", isMet: password.contains(where: { $0.isNumber }))
                    }
                }
            } header: {
                Text("Password Validation")
            }
        }
        .navigationTitle("SecureField")
    }
}

struct PasswordStrengthIndicator: View {
    let password: String
    
    private var strength: Int {
        var score = 0
        if password.count >= 8 { score += 1 }
        if password.count >= 12 { score += 1 }
        if password.contains(where: { $0.isUppercase }) { score += 1 }
        if password.contains(where: { $0.isNumber }) { score += 1 }
        return min(score, 3)
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<3) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(index < strength ? strengthColor : Color.secondary.opacity(0.3))
                    .frame(height: 4)
            }
        }
        .frame(width: 60)
    }
    
    private var strengthColor: Color {
        switch strength {
        case 1: return .red
        case 2: return .orange
        case 3: return .green
        default: return .secondary
        }
    }
}

struct PasswordRequirement: View {
    let text: String
    let isMet: Bool
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: isMet ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(isMet ? .green : .secondary)
                .font(.caption)
            Text(text)
                .font(.caption)
                .foregroundStyle(isMet ? .primary : .secondary)
        }
    }
}

#Preview {
    NavigationStack {
        SecureFieldDemoView()
    }
}

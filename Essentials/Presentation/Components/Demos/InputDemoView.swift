import SwiftUI
import Combine

struct InputDemoView: View {
    // MARK: - State
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    @State private var bio: String = "Tell us about yourself..."
    @State private var searchText: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            // MARK: - Label Styles
            Section {
                Label("Default Label Style", systemImage: "tag.fill")
                
                Label("Icon Only", systemImage: "star.fill")
                    .labelStyle(.iconOnly)
                    .foregroundStyle(.orange)
                
                Label("Title Only", systemImage: "heart.fill")
                    .labelStyle(.titleOnly)
                
                Label {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Custom Label")
                            .font(.headline)
                        Text("With subtitle")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                } icon: {
                    Image(systemName: "person.circle.fill")
                        .foregroundStyle(.blue)
                        .font(.title2)
                }
            } header: {
                Text("Label Styles")
            } footer: {
                Text("Different label styles for various use cases. Adapts to \(colorScheme == .dark ? "dark" : "light") mode.")
            }
            
            // MARK: - TextField Styles
            Section {
                // Default TextField
                TextField("Username", text: $username)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                
                // Email TextField
                TextField("Email Address", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                
                // Phone Number TextField
                TextField("Phone Number", text: $phoneNumber)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
                
                // Search TextField
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    TextField("Search...", text: $searchText)
                }
                .padding(8)
                .background(Color(uiColor: .tertiarySystemGroupedBackground))
                .cornerRadius(10)
                
            } header: {
                Text("TextField Variations")
            } footer: {
                Text("Real-world text input examples with proper keyboard types and content types.")
            }
            
            // MARK: - SecureField with Show/Hide
            Section {
                HStack {
                    if showPassword {
                        TextField("Password", text: $password)
                            .textContentType(.password)
                    } else {
                        SecureField("Password", text: $password)
                            .textContentType(.password)
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
                            .textContentType(.password)
                    } else {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textContentType(.password)
                    }
                    
                    Button {
                        showConfirmPassword.toggle()
                    } label: {
                        Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
                
                // Password Strength Indicator
                if !password.isEmpty {
                    HStack {
                        Text("Strength:")
                            .font(.caption)
                        PasswordStrengthView(password: password)
                    }
                }
                
            } header: {
                Text("SecureField with Visibility Toggle")
            } footer: {
                Text("Tap the eye icon to show/hide password. Common in login/signup forms.")
            }
            
            // MARK: - TextEditor
            Section {
                TextEditor(text: $bio)
                    .frame(height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
                    )
                
                Text("\(bio.count) characters")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            } header: {
                Text("TextEditor (Multi-line)")
            } footer: {
                Text("Use TextEditor for longer text input like bios, comments, or notes.")
            }
        }
        .navigationTitle("Text Inputs")
    }
}

// MARK: - Password Strength Component
struct PasswordStrengthView: View {
    let password: String
    
    private var strength: PasswordStrength {
        if password.count < 6 {
            return .weak
        } else if password.count < 10 {
            return .medium
        } else {
            return .strong
        }
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<3) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(index < strength.rawValue ? strength.color : Color.secondary.opacity(0.3))
                    .frame(height: 4)
            }
        }
        .frame(width: 60)
        
        Text(strength.label)
            .font(.caption)
            .foregroundStyle(strength.color)
    }
    
    enum PasswordStrength: Int {
        case weak = 1
        case medium = 2
        case strong = 3
        
        var label: String {
            switch self {
            case .weak: return "Weak"
            case .medium: return "Medium"
            case .strong: return "Strong"
            }
        }
        
        var color: Color {
            switch self {
            case .weak: return .red
            case .medium: return .orange
            case .strong: return .green
            }
        }
    }
}

#Preview {
    NavigationStack {
        InputDemoView()
    }
}

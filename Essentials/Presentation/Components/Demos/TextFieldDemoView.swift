import SwiftUI
import Combine

struct TextFieldDemoView: View {
    @State private var text: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var searchText: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Enter text", text: $text)
                
                if !text.isEmpty {
                    Text("You typed: \(text)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Basic TextField")
            }
            
            Section {
                TextField("Username", text: $username)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            } header: {
                Text("Username Field")
            } footer: {
                Text("With autocorrection disabled and no capitalization")
            }
            
            Section {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
            } header: {
                Text("Email Field")
            } footer: {
                Text("Optimized keyboard and autocomplete for email")
            }
            
            Section {
                TextField("Phone Number", text: $phone)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
            } header: {
                Text("Phone Field")
            } footer: {
                Text("Shows numeric keypad")
            }
            
            Section {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    TextField("Search", text: $searchText)
                }
                .padding(8)
                .background(Color(uiColor: .tertiarySystemGroupedBackground))
                .cornerRadius(10)
            } header: {
                Text("Search Field")
            }
        }
        .navigationTitle("TextField")
    }
}

#Preview {
    NavigationStack {
        TextFieldDemoView()
    }
}

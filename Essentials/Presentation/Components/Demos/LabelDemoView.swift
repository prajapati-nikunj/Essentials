import SwiftUI
import Combine

struct LabelDemoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            Section {
                Label("Default Label", systemImage: "star.fill")
                
                Label("With Color", systemImage: "heart.fill")
                    .foregroundStyle(.red)
                
                Label("Large Font", systemImage: "sun.max.fill")
                    .font(.title2)
                    .foregroundStyle(.orange)
            } header: {
                Text("Default Label Style")
            } footer: {
                Text("Both icon and title are visible")
            }
            
            Section {
                // Show icon only with explanation
                VStack(alignment: .leading, spacing: 8) {
                    Text("Icon Only Example:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 20) {
                        Label("Hidden Title", systemImage: "heart.fill")
                            .labelStyle(.iconOnly)
                            .foregroundStyle(.red)
                            .font(.largeTitle)
                        
                        Label("Hidden Title", systemImage: "star.fill")
                            .labelStyle(.iconOnly)
                            .foregroundStyle(.yellow)
                            .font(.largeTitle)
                        
                        Label("Hidden Title", systemImage: "moon.fill")
                            .labelStyle(.iconOnly)
                            .foregroundStyle(.purple)
                            .font(.largeTitle)
                    }
                }
                .padding(.vertical, 8)
            } header: {
                Text("Icon Only Style")
            } footer: {
                Text("Only the icon is shown, title is hidden")
            }
            
            Section {
                // Show title only with explanation
                VStack(alignment: .leading, spacing: 8) {
                    Text("Title Only Example:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    VStack(alignment: .leading) {
                        Label("Photos", systemImage: "photo")
                            .labelStyle(.titleOnly)
                        
                        Label("Camera", systemImage: "camera")
                            .labelStyle(.titleOnly)
                            .foregroundStyle(.blue)
                        
                        Label("Videos", systemImage: "video")
                            .labelStyle(.titleOnly)
                            .foregroundStyle(.purple)
                    }
                }
                .padding(.vertical, 8)
            } header: {
                Text("Title Only Style")
            } footer: {
                Text("Only the title is shown, icon is hidden")
            }
            
            Section {
                Label {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Custom Label")
                            .font(.headline)
                        Text("With subtitle and custom styling")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                } icon: {
                    Image(systemName: "person.circle.fill")
                        .foregroundStyle(.blue)
                        .font(.title)
                }
                
                Label {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Premium Account")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Active until Dec 2025")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    }
                } icon: {
                    Image(systemName: "crown.fill")
                        .foregroundStyle(.yellow)
                        .font(.title2)
                }
            } header: {
                Text("Custom Complex Labels")
            }
            
            Section {
                Label("Photos", systemImage: "photo")
                Label("Camera", systemImage: "camera")
                    .foregroundStyle(.blue)
                Label("Person", systemImage: "person")
                    .foregroundStyle(.purple)
                Label("Location", systemImage: "location.fill")
                    .foregroundStyle(.red)
                Label("Settings", systemImage: "gearshape.fill")
                    .foregroundStyle(.gray)
            } header: {
                Text("Common Use Cases")
            } footer: {
                Text("Works perfectly in \(colorScheme == .dark ? "dark" : "light") mode")
            }
            
            Section {
                // Colored backgrounds to show visibility
                VStack(spacing: 12) {
                    Label("Success Message", systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.green.gradient)
                        .cornerRadius(10)
                    
                    Label("Warning Alert", systemImage: "exclamationmark.triangle.fill")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.orange.gradient)
                        .cornerRadius(10)
                    
                    Label("Error Notification", systemImage: "xmark.circle.fill")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.red.gradient)
                        .cornerRadius(10)
                    
                    Label("Info Banner", systemImage: "info.circle.fill")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue.gradient)
                        .cornerRadius(10)
                }
            } header: {
                Text("Colored Backgrounds")
            } footer: {
                Text("Labels with colored backgrounds for better visibility")
            }
        }
        .navigationTitle("Label")
    }
}

#Preview {
    NavigationStack {
        LabelDemoView()
    }
}

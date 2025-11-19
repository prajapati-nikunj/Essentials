import SwiftUI
import Combine

struct PickerDemoView: View {
    @State private var selectedFruit: String = "Apple"
    @State private var selectedSize: String = "Medium"
    @State private var selectedCountry: String = "USA"
    @State private var selectedTime: String = "Morning"
    
    let fruits = ["Apple", "Banana", "Orange", "Grape", "Strawberry"]
    let sizes = ["Small", "Medium", "Large", "X-Large"]
    let countries = ["USA", "Canada", "UK", "Australia", "Japan"]
    let times = ["Morning", "Afternoon", "Evening", "Night"]
    
    var body: some View {
        Form {
            Section {
                Picker("Select Fruit", selection: $selectedFruit) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit).tag(fruit)
                    }
                }
            } header: {
                Text("Menu Picker (Default)")
            }
            
            Section {
                Picker("Size", selection: $selectedSize) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size).tag(size)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Segmented Picker")
            }
            
            Section {
                Picker("Country", selection: $selectedCountry) {
                    ForEach(countries, id: \.self) { country in
                        Text(country).tag(country)
                    }
                }
                .pickerStyle(.inline)
            } header: {
                Text("Inline Picker")
            }
            
            Section {
                Picker("Time of Day", selection: $selectedTime) {
                    ForEach(times, id: \.self) { time in
                        Label(time, systemImage: timeIcon(for: time))
                            .tag(time)
                    }
                }
                .pickerStyle(.menu)
            } header: {
                Text("Picker with Icons")
            }
            
            Section {
                HStack {
                    Text("Selected:")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(selectedFruit)
                        .fontWeight(.semibold)
                }
            } header: {
                Text("Current Selection")
            }
        }
        .navigationTitle("Picker")
    }
    
    private func timeIcon(for time: String) -> String {
        switch time {
        case "Morning": return "sunrise.fill"
        case "Afternoon": return "sun.max.fill"
        case "Evening": return "sunset.fill"
        case "Night": return "moon.stars.fill"
        default: return "clock"
        }
    }
}

#Preview {
    NavigationStack {
        PickerDemoView()
    }
}

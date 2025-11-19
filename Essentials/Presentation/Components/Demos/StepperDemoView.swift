import SwiftUI
import Combine

struct StepperDemoView: View {
    @State private var value: Int = 0
    @State private var quantity: Int = 1
    @State private var guests: Int = 2
    @State private var age: Int = 25
    
    var body: some View {
        Form {
            Section {
                Stepper("Value: \(value)", value: $value)
            } header: {
                Text("Basic Stepper")
            }
            
            Section {
                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                
                HStack {
                    Text("Total: $\(quantity * 29).00")
                        .font(.headline)
                }
            } header: {
                Text("Shopping Cart")
            } footer: {
                Text("Limited to 1-10 items")
            }
            
            Section {
                HStack {
                    Text("Number of Guests")
                    Spacer()
                    Stepper("", value: $guests, in: 1...20)
                    Text("\(guests)")
                        .font(.headline)
                        .frame(minWidth: 30)
                }
            } header: {
                Text("Compact Stepper")
            }
            
            Section {
                Stepper(value: $age, in: 0...120, step: 1) {
                    HStack {
                        Text("Age")
                        Spacer()
                        Text("\(age) years")
                            .foregroundStyle(.secondary)
                    }
                }
            } header: {
                Text("With Custom Label")
            }
        }
        .navigationTitle("Stepper")
    }
}

#Preview {
    NavigationStack {
        StepperDemoView()
    }
}

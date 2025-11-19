import SwiftUI
import Combine

struct DatePickerDemoView: View {
    @State private var selectedDate: Date = Date()
    @State private var birthDate: Date = Date()
    @State private var meetingTime: Date = Date()
    @State private var reminderTime: Date = Date()
    
    var body: some View {
        Form {
            Section {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
            } header: {
                Text("Date Only")
            }
            
            Section {
                DatePicker("Birth Date", selection: $birthDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
            } header: {
                Text("Graphical Style")
            }
            
            Section {
                DatePicker("Meeting Time", selection: $meetingTime, displayedComponents: [.date, .hourAndMinute])
            } header: {
                Text("Date and Time")
            }
            
            Section {
                DatePicker("Reminder", selection: $reminderTime, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.wheel)
            } header: {
                Text("Time Only (Wheel)")
            }
            
            Section {
                DatePicker(
                    "Appointment",
                    selection: $meetingTime,
                    in: Date()...,
                    displayedComponents: [.date, .hourAndMinute]
                )
            } header: {
                Text("Future Dates Only")
            } footer: {
                Text("Limits selection to dates from today onwards")
            }
            
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Selected Date:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(selectedDate, style: .date)
                        .font(.headline)
                    Text(selectedDate, style: .time)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Formatted Output")
            }
        }
        .navigationTitle("DatePicker")
    }
}

#Preview {
    NavigationStack {
        DatePickerDemoView()
    }
}

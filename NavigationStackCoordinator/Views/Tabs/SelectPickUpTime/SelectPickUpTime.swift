//
//  SelectPickUpTime.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import SwiftUI

struct SelectPickUpTime: View {
    var selectedDateTime: (DateTimeDTO) -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var selectedDate = Date()
    @State private var showingTimePicker = false
    @State private var selectedTime = Date()

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Header
            HStack {
                Text(showingTimePicker ? "Select the pickup Time" : "Select the pickup Date")
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal)

            if !showingTimePicker {
                // Date picker
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .tint(.pink)
                .padding()
                .transition(.asymmetric(
                    insertion: .move(edge: .leading),
                    removal: .move(edge: .leading)
                ))

                // Next button
                PrimaryButton(title: "Next") {
                    withAnimation {
                        showingTimePicker = true
                    }
                }
                .padding()
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .trailing)
                ))
            } else {
                // Native time picker
                DatePicker(
                    "",
                    selection: $selectedTime,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding()
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .trailing)
                ))

                // Done button
                PrimaryButton(title: "Done") {
                    let calendar = Calendar.current
                    let timeComponents = calendar.dateComponents([.hour, .minute], from: selectedTime)
                    var dateComponents = calendar.dateComponents([.year, .month, .day], from: selectedDate)
                    dateComponents.hour = timeComponents.hour
                    dateComponents.minute = timeComponents.minute

                    if let date = calendar.date(from: dateComponents) {
                        let dateTime = DateTimeDTO(dateTime: date.formatted(date: .numeric, time: .shortened))
                        selectedDateTime(dateTime)
                        dismiss()
                    }
                }
                .padding()
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .trailing)
                ))
            }
        }
        .animation(.easeInOut, value: showingTimePicker)
        .background(Color(.grayF9FAFB))
        .padding(.top)
    }
}

#Preview {
    SelectPickUpTime { dateTime in
        // Preview callback
        print("Selected datetime: \(dateTime)")
    }
}

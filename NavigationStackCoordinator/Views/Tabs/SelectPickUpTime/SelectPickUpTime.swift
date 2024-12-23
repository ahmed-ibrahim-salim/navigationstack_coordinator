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
        VStack {
            Rectangle()
                .fill(Color.clear)
                .frame(height: 2)

            // Header
            HStack {
                H4Label(text: showingTimePicker ? "Select the pickup Time" : "Select the pickup Date")
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.gray)
                }
            }
            .padding()
            .background(.white)
            .roundedTopCorners()

            if !showingTimePicker {
                CustomDatePicker(
                    selection: $selectedDate,
                    displayedComponents: [.date],
                    style: .graphical
                )
                .padding()
                .background(.white)
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
                .background(.white)
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .trailing)
                ))
            } else {
                CustomDatePicker(
                    selection: $selectedTime,
                    displayedComponents: [.hourAndMinute],
                    style: .wheel
                )
                .padding()
                .background(.white)
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .trailing)
                ))

                // Done button
                PrimaryButton(title: "Done") {
                    if let date = getDateComponents() {
                        let dateTime = DateTimeDTO(dateTime: date.formatted(date: .numeric, time: .shortened))
                        selectedDateTime(dateTime)
                        dismiss()
                    }
                }
                .padding()
                .background(.white)
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .trailing)
                ))
            }
        }
        .padding(.horizontal, 4)
        .animation(.easeInOut, value: showingTimePicker)
    }

    private func getDateComponents() -> Date? {
        let calendar = Calendar.current
        let timeComponents = calendar.dateComponents([.hour, .minute], from: selectedTime)
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: selectedDate)
        dateComponents.hour = timeComponents.hour
        dateComponents.minute = timeComponents.minute
        return calendar.date(from: dateComponents)
    }
}

#Preview {
    SelectPickUpTime { dateTime in
        // Preview callback
        print("Selected datetime: \(dateTime)")
    }
}

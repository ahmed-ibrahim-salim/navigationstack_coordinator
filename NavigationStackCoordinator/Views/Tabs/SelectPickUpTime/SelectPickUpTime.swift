//
//  SelectPickUpTime.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import SwiftUI

struct SelectPickUpTime: View {
    @Environment(\.dismiss) private var dismiss
    var selectedDateTime: (DateTimeDTO) -> Void
    @State private var selectedDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Header
            HStack {
                Text("Select the pickup date")
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal)

            // Calendar
            DatePicker(
                "Select Date",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .tint(.pink)
            .padding()

            // Next button
            PrimaryButton(title: "Next") {
                let dateTime = DateTimeDTO(dateTime: selectedDate.formatted(date: .numeric, time: .shortened))
                selectedDateTime(dateTime)
                print(dateTime.dateTime)
                dismiss()
            }
            .padding()
        }
        .background(Color(.grayF9FAFB))
        .padding(.top)
    }
}

// #Preview {
//    SelectPickUpTime()
// }

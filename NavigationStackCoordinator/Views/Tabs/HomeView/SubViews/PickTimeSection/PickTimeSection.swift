//
//  PickTimeSection.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct PickTimeSection: View {
    @Binding var timeOptions: [Option]
    var onChoosingOption: (DateTimeDTO) -> Void
    var openDateTimeSheet: () -> Void
    var resetSchedule: () -> Void
    @State private var selectedOption: Option?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Pickup time")
            SelectionItemsView(options: $timeOptions, selectedOption: $selectedOption)
                .onChange(of: selectedOption) { newValue in
                    guard let option = newValue else {
                        resetSchedule()
                        return
                    }

                    if option.id == 44 {
                        openDateTimeSheet()
                        return
                    }

                    resetSchedule()
                    onChoosingOption(option.getDateTimeDTO())
                }
        }
    }
}

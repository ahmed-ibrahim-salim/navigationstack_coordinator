//
//  PickTimeSection.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct PickTimeSection: View {
    @State private var selectedOption: Option?
    var onChoosingOption: (DateTimeDTO) -> Void
    var openDateTimeSheet: () -> Void

    private let timeOptions: [Option] = [
        Option(id: 1, title: "10-20 min", image: nil),
        Option(id: 2, title: "Up to 1 hour", image: nil),
        Option(id: 44, title: "Schedule delivery", image: .icSchedule)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Pickup time")
            SelectionItemsView(options: timeOptions, selectedOption: $selectedOption)
                .onChange(of: selectedOption) { newValue in
                    if let option = newValue, option.id == 44 {
                        openDateTimeSheet()
                        return
                    }
                    if let option = newValue {
                        onChoosingOption(option.getDateTimeDTO())
                    }
                }
        }
    }
}

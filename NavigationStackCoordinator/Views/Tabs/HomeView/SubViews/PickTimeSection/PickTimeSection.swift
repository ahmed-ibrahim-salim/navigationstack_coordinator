//
//  PickTimeSection.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct PickTimeSection: View {
    @State private var selectedOption: Option?

    private let timeOptions: [Option] = [
        Option(title: "10-20 min", image: nil),
        Option(title: "Up to 1 hour", image: nil),
        Option(title: "Schedule delivery", image: .icSchedule)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Pickup time")
            SelectionItemsView(options: timeOptions, selectedOption: $selectedOption)
        }
    }
}



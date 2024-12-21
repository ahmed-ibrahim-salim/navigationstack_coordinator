//
//  ComodityTypeSection.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct ComodityTypeSection: View {
    @State private var selectedOption: Option?

    private let commodityOptions: [Option] = [
        Option(title: "Agricultural Products", image: nil),
        Option(title: "Raw Materials", image: nil),
        Option(title: "Construction Materials", image: nil)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Select Commodity type")

            SelectionItemsView(options: commodityOptions, selectedOption: $selectedOption)
        }
    }
}

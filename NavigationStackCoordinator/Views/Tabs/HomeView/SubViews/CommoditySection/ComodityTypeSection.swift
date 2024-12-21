//
//  ComodityTypeSection.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct ComodityTypeSection: View {
    var onChoosingOption: (CommodityDTO) -> Void

    @State private var selectedOption: Option?

    private let commodityOptions: [Option] = [
        Option(id: 1, title: "Agricultural Products", image: nil),
        Option(id: 2, title: "Raw Materials", image: nil),
        Option(id: 3, title: "Construction Materials", image: nil)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Select Commodity type")

            SelectionItemsView(options: commodityOptions, selectedOption: $selectedOption)
                .onChange(of: selectedOption) { newValue in
                    if let option = newValue {
                        onChoosingOption(option.getCommodityDTO())
                    }
                }
        }
    }
}

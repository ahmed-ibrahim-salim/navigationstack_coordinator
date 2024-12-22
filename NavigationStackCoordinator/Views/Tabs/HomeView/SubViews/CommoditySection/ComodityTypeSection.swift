//
//  ComodityTypeSection.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct ComodityTypeSection: View {
    @Binding var commodityOptions: [Option]
    var onChoosingOption: (CommodityDTO) -> Void

    @State private var selectedOption: Option?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Select Commodity type")

            SelectionItemsView(options: $commodityOptions, selectedOption: $selectedOption)
                .onChange(of: selectedOption) { newValue in
                    if let option = newValue {
                        onChoosingOption(option.getCommodityDTO())
                    }
                }
        }
    }
}

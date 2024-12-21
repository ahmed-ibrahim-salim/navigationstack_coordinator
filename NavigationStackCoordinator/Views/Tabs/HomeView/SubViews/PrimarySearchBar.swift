//
//  PrimarySearchBar.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct PrimarySearchBar: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Order locations")

            HStack(spacing: 12) {
                Image(.icSearch)
                    .frame(width: 40, height: 40)

                H8Label(text: "Where to?")
                    .foregroundColor(Color(.black4D4D4D))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(.white))
            .addBorder()
        }
    }
}

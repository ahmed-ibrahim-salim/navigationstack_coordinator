//
//  RoundedTopCornersModifier.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 23/12/2024.
//

import SwiftUI

struct RoundedTopCornersModifier: ViewModifier {
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .clipShape(
                .rect(
                    topLeadingRadius: radius,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: radius
                )
            )
    }
}

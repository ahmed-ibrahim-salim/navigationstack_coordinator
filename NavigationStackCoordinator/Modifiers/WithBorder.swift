//
//  WithBorder.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 20/12/2024.
//

import SwiftUI

struct WithBorder: ViewModifier {
    let radius: CGFloat
    let strokeColor: Color
    let lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .cornerRadius(radius)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(strokeColor, lineWidth: lineWidth)
            )
    }
}

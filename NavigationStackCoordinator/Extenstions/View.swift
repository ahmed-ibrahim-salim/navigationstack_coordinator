//
//  View.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 18/12/2024.
//

import SwiftUI

extension View {
    func customFont(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(CustomFontModifier(size: size, weight: weight))
    }

    func addBorder(radius: CGFloat = 12.0, strokeColor: Color = .init(.grayF2F2F2), lineWidth: CGFloat = 1.0) -> some View {
        modifier(WithBorder(radius: radius, strokeColor: strokeColor, lineWidth: lineWidth))
    }
}

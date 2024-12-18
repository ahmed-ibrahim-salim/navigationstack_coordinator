//
//  CustomFontModifier.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 18/12/2024.
//

import SwiftUI

struct CustomFontModifier: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    @Environment(\.layoutDirection) private var layoutDirection

    private var fontName: String {
        let isRTL = layoutDirection == .rightToLeft
        let family = isRTL ? "Montserrat" : "Montserrat"

        switch weight {
        case .ultraLight:
            return "\(family)-ExtraLight"
        case .thin:
            return "\(family)-Thin"
        case .light:
            return "\(family)-Light"
        case .regular:
            return "\(family)-Regular"
        case .medium:
            return "\(family)-Medium"
        case .semibold:
            return "\(family)-SemiBold"
        case .bold:
            return "\(family)-Bold"
        case .heavy:
            return "\(family)-ExtraBold"
        case .black:
            return "\(family)-Black"
        default:
            return "\(family)-Regular"
        }
    }

    func body(content: Content) -> some View {
        content.font(.custom(fontName, size: size))
    }
}



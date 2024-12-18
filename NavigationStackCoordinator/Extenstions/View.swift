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
}

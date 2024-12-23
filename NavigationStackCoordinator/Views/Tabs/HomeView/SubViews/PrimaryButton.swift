//
//  PrimaryButton.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            B1Label(text: title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.accentColorFF007E))
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
        }
    }
}

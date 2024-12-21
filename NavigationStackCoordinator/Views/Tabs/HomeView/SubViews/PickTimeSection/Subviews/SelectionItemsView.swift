//
//  SelectionItemsView.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 20/12/2024.
//

import SwiftUI

struct SelectionItemsView<T: Selectable>: View {
    let options: [T]
    @Binding var selectedOption: T?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(options) { option in
                    Button {
                        withAnimation(.spring()) {
                            selectedOption = selectedOption?.id == option.id ? nil : option
                        }
                    } label: {
                        HStack(spacing: 6) {
                            if let image = option.image {
                                Image(image)
                            }

                            P6Label(text: option.title)
                                .lineLimit(1)
                                .foregroundColor(
                                    selectedOption?.id == option.id ? .white : .primary
                                )
                        }
                        .frame(height: 40)
                        .padding(.horizontal, 16)
                        .background(
                            selectedOption?.id == option.id ? Color(.black333333) : Color(.white)
                        )
                        .addBorder()
                    }
                }
            }
            .padding(.horizontal, 1)
        }
    }
}

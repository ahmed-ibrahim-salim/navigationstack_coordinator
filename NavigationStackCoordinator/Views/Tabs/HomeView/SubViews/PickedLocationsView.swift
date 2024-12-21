//
//  PickedLocationsView.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import SwiftUI

struct PickedLocationsView: View {
    @Binding var locationPoints: [any LocationPoint]
    let onTap: () -> Void

    var body: some View {
        Button(action: {
            onTap()
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(Array(locationPoints.enumerated()), id: \.element.id) { index, location in
                        HStack(spacing: 2) {
                            Image(location.getImage())
                                .frame(width: 20, height: 20)
                                .offset(y: 3)
                            P7Label(text: location.getFullLocationTitle(index))
                        }
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(Color(.black333333))
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(.grayF9FAFB))
            .addBorder(strokeColor: Color(.gray999999))
        }
    }
}

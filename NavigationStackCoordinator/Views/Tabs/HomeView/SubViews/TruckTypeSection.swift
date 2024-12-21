//
//  TruckTypeSection.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct TruckTypeSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            H9Label(text: "Select truck type")

            Button {
                // Action
            } label: {
                HStack {
                    Image(.icPickupTruck)
                    Text("Select the truck type")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(Color(.black333333))
                .padding()
                .background(.white)
                .frame(height: 56)
                .addBorder(strokeColor: Color(.gray999999))
            }
        }
    }
}

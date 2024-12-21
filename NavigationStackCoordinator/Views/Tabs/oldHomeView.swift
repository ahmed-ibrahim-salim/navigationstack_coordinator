//
//  oldHomeView.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct OldHomeView: View {
    @State var isLoading: Bool = true

    var body: some View {
        ZStack {
            VStack {
                Text("This is the first view 1️⃣!")
                    .customFont(size: 20, weight: .semibold)

                Text(L10n.hello)
                    .customFont(size: 20, weight: .semibold)
                    .skeleton(with: isLoading)
                    .frame(maxWidth: 200, maxHeight: 40)

                Text(L10n.lookingGood)
                    .customFont(size: 20, weight: .semibold)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
}

#Preview {
    OldHomeView()
}

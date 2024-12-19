//
//  CustomTabBar.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

// reference: https://github.com/CodeWithMobility/SwiftUICustomTab
struct CustomTabBar: View {
    @Binding var selectedTab: Int
    let tabItems: [TabItem]
    let indicatorWidth: CGFloat
    let color: Color

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: -2)

            HStack(spacing: 0) {
                ForEach(0 ..< tabItems.count, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            selectedTab = index
                        }
                    }) {
                        VStack {
                            Image(selectedTab == index ? tabItems[index].iconSelected : tabItems[index].iconNotSelected)
                                .font(.system(size: 24))
                                .foregroundColor(selectedTab == index ? color : .gray)
                                .frame(width: 32, height: 32)

                            Text(tabItems[index].title)
                                .font(.caption)
                                .foregroundColor(selectedTab == index ? color : .gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 10)
                    }
                }
            }

            GeometryReader { geometry in
                let tabWidth = geometry.size.width / CGFloat(tabItems.count)
                let indicatorOffset = (tabWidth * CGFloat(selectedTab)) + (tabWidth - indicatorWidth) / 2

                color
                    .frame(width: indicatorWidth, height: 4)
                    .cornerRadius(2)
                    .offset(x: indicatorOffset)
                    .animation(.easeInOut(duration: 0.2), value: selectedTab)
            }
        }

        .frame(height: 80)
    }

    private func isSelected(index: Int) -> Bool {
        selectedTab == index
    }
}

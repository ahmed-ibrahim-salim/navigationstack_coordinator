//
//  TapsView.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 17/12/2024.
//

import SwiftUI

struct TapsView: View {
    @State private var selectedTab = 0

    var body: some View {
        let tabItems = [TabItem(title: "Home", iconSelected: .icHomeTab, iconNotSelected: .icHomeTabNotSelected),
                        TabItem(title: "Wallet", iconSelected: .icWalletTab, iconNotSelected: .icWalletTabNotSelected),
                        TabItem(title: "Orders", iconSelected: .icOrdersTab, iconNotSelected: .icOrdersTabNotSelected),
                        TabItem(title: "Messages", iconSelected: .icMessagesTab, iconNotSelected: .icMessagesTabNotSelected),
                        TabItem(title: "More", iconSelected: .icMoreTab, iconNotSelected: .icMoreTabNotSelected)]

        VStack {
            // Main content view based on selected tab
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: WalletView()
                case 2: OrdersView()
                case 3: MessagesView()
                case 4: MoreView()
                default: HomeView()
                }
            }

            Spacer()

            CustomTabBar(selectedTab: $selectedTab, tabItems: tabItems, indicatorWidth: 56, color: Color.pink)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TapsView()
}

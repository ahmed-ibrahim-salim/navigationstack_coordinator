//
//  TapsView.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 17/12/2024.
//

import SwiftUI

struct TapsView: View {
    private let uicolor = UIColor(resource: .ourPink).withAlphaComponent(0.5).cgColor
    let swifyuiColor = Color(.ourPink).opacity(0.5).cgColor
    private let image = UIImage(resource: .woodIcon)
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }

            WalletView()
                .tabItem {
                    VStack {
                        Image(systemName: "creditcard.fill")
                        Text("Wallet")
                    }
                }

            OrdersView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Orders")
                    }
                }

            MessagesView()
                .tabItem {
                    VStack {
                        Image(systemName: "bubble.left.fill")
                        Text("Messages")
                    }
                }

            MoreView()
                .tabItem {
                    VStack {
                        Image(systemName: "ellipsis")
                        Text("More")
                    }
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.systemGray6

            // Configure shadow
            let image = UIImage.gradientImageWithBounds(
                bounds: CGRect(x: 0, y: 0, width: UIScreen.main.scale, height: 6),
                colors: [
                    UIColor.clear.cgColor,
                    UIColor.black.withAlphaComponent(0.1).cgColor
                ]
            )
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = image

            // Configure tab item appearances
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(resource: .ourPink)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemPink]

            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray2
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray2]

            // Apply appearance
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

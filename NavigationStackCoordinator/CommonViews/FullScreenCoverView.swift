//
//  FullScreenCoverView.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 23/12/2024.
//

import SwiftUI

struct FullScreenCoverView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            content
                .padding(.bottom, 20)
                .background(Color(.grayF9FAFB))
                .roundedTopCorners(radius: 16)
        }
        .ignoresSafeArea(.all)
        .background(ClearBackgroundView())
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()

            superview?.superview?.backgroundColor = .clear
        }
    }
}

//
//  labels.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct P4Label: View {
    let text: String

    var body: some View {
        Text(text)
            .customFont(size: 14, weight: .medium)
    }
}

struct P7Label: View {
    let text: String

    var body: some View {
        Text(text)
            .customFont(size: 12, weight: .medium)
    }
}

struct P6Label: View {
    let text: String

    var body: some View {
        Text(text)
            .customFont(size: 12, weight: .semibold)
    }
}

struct H8Label: View {
    let text: String

    var body: some View {
        Text(text)
            .customFont(size: 16, weight: .semibold)
    }
}

struct H9Label: View {
    let text: String

    var body: some View {
        Text(text)
            .customFont(size: 14, weight: .semibold)
    }
}

struct H4Label: View {
    let text: String

    var body: some View {
        Text(text)
            .customFont(size: 20, weight: .semibold)
    }
}

// Buttons
struct B1Label: View {
    let text: String

    var body: some View {
        Text(text)
            .customFont(size: 16, weight: .bold)
    }
}

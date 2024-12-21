//
//  SelectableOption.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 20/12/2024.
//

import SwiftUI

protocol Selectable: Identifiable {
    var id: UUID { get }
    var title: String { get }
    var image: ImageResource? { get }
}

struct Option: Selectable {
    let id = UUID()
    let title: String
    let image: ImageResource?
}

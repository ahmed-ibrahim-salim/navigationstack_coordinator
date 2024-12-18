//
//  BaseCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 17/12/2024.
//

import SwiftUI

class BaseCoordinator<T: Hashable>: ObservableObject {
    @Published var paths: [T] = []

    func push(_ path: T) {
        paths.append(path)
    }

    func pop() {
        paths.removeLast()
    }

    func popToRoot() {
        paths = []
    }

    func replacePath(_ paths: [T]) {
        self.paths = paths
    }
}

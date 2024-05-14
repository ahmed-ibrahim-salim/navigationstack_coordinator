//
//  Coordinator.swift
//  NavigationStackCoordinator
//
//  Created by Saad El Oulladi on 18/04/2023.
//

import SwiftUI

enum Route: Hashable {
    
    case secondView(param: String)
    case thirdView

    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .secondView:
            SecondView()
        case .thirdView:
            ThirdView()
        }
   }
}

final class Coordinator<T: Hashable>: ObservableObject {
    
    @Published var paths: [T] = []
    
    func push(_ path: T) {
        paths.append(path)
    }

    func pop() {
        paths.removeLast()
    }

    func popToRoot(){
       paths = []
    }

    func replacePath(_ paths: [T]) {
        self.paths = paths
    }
}

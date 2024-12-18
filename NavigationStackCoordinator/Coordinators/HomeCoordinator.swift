//
//  HomeCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Saad El Oulladi on 18/04/2023.
//

import SwiftUI

enum HomeCoordinatorRoute: Hashable {
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

final class HomeCoordinator<T: Hashable>: BaseCoordinator<T> {}

//
//  LocationPoint.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

struct LocationPointDTO {
    let latitude: Double
    let longitude: Double
    let title: String
    let address: String

    func makeParams() -> [String: Any] {
        [
            "lat": latitude,
            "long": longitude
        ]
    }
}

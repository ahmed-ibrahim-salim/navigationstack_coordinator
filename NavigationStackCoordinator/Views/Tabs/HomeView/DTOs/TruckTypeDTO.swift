//
//  TruckTypeDTO.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

struct TruckTypeDTO {
    let id: Int
    let name: String
    let image: String

    func makeParams() -> [String: Any] {
        [
            "id": id
        ]
    }
}

//
//  CommodityDTO.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

struct CommodityDTO {
    let id: Int
    let name: String

    func makeParams() -> [String: Any] {
        [
            "id": id
        ]
    }
}

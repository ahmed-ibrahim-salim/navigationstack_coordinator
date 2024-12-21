//
//  ServiceOptionDTO.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

struct ServiceOptionDTO {
    let id: Int
    let image: String
    let title: String

    func makeParams() -> [String: Any] {
        [
            "id": id
        ]
    }
}

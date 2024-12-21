//
//  DateTimeDTO.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

struct DateTimeDTO {
    let date: Date
    let time: Date

    func makeParams() -> [String: Any] {
        [
            "date": date,
            "time": time
        ]
    }
}

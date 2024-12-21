//
//  DateTimeDTO.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

struct DateTimeDTO {
    let dateTime: String

    func makeParams() -> [String: Any] {
        [
            "date_time": dateTime
        ]
    }
}

//
//  SelectableOption.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 20/12/2024.
//

import SwiftUI

protocol Selectable: Identifiable, Equatable {
    var id: Int { get }
    var title: String { get set }
    var image: ImageResource? { get }
}

struct Option: Selectable {
    let id: Int
    var title: String
    let image: ImageResource?

    func getCommodityDTO() -> CommodityDTO {
        CommodityDTO(id: id, name: title)
    }

    func getDateTimeDTO() -> DateTimeDTO {
        DateTimeDTO(dateTime: title)
    }
}

struct Schedule: Selectable {
    static func == (lhs: Schedule, rhs: Schedule) -> Bool {
        lhs.id == rhs.id
    }

    let id: Int
    var title: String = "Schedule delivery"
    let image: ImageResource?
}

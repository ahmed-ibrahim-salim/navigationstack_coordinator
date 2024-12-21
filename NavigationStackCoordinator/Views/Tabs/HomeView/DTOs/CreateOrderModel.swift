//
//  CreateOrderModel.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

struct CreateOrderModel {
    var locationPoints: [any LocationPoint]
    var deliveryDateTime: DateTimeDTO
    var commodity: CommodityDTO
    var truckType: TruckTypeDTO
    var serviceOptions: [ServiceOptionDTO]?
    var note: String?
    var pictures: [String]?

    static func makeEmpty() -> CreateOrderModel {
        CreateOrderModel(
            locationPoints: [],
            deliveryDateTime: DateTimeDTO(dateTime: ""),
            commodity: CommodityDTO(id: 0, name: ""),
            truckType: TruckTypeDTO(id: 0, name: "", image: ""),
            serviceOptions: nil,
            note: nil,
            pictures: nil
        )
    }

    func makeParams() -> [String: Any] {
        var params: [String: Any] = [
            "locationPoints": locationPoints.map { $0.makeParams() },
            "deliveryDateTime": deliveryDateTime.makeParams(),
            "commodity": commodity.makeParams(),
            "truckType": truckType.makeParams()
        ]

        if let serviceOptions = serviceOptions {
            params["serviceOptions"] = serviceOptions.map { $0.makeParams() }
        }

        if let note = note {
            params["note"] = note
        }

        if let pictures = pictures {
            params["pictures"] = pictures
        }

        return params
    }
}

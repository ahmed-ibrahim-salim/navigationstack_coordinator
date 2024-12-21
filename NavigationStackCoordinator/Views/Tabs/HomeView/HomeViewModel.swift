//
//  HomeViewModel.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var createOrderModel: CreateOrderModel

    init(createOrderModel: CreateOrderModel = CreateOrderModel.makeEmpty()) {
        self.createOrderModel = createOrderModel
        chageCreateOrder()
    }

    private func chageCreateOrder() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let createOrderModel = CreateOrderModel(
                locationPoints: [
                    PickUpLocationDTO(id: 1, latitude: 12.0, longitude: 12.0, title: "Location 1", address: "Address 1"),
                    PickUpLocationDTO(id: 2, latitude: 12.0, longitude: 12.0, title: "Location 2", address: "Address 2"),
                    DropOffLocationDTO(id: 3, latitude: 12.0, longitude: 12.0, title: "Location 3", address: "Address 3")
                ],
                deliveryDateTime: DateTimeDTO(dateTime: ""),
                commodity: CommodityDTO(id: 0, name: ""),
                truckType: TruckTypeDTO(id: 1, name: "Truck", image: "truck"),
                serviceOptions: nil,
                note: nil,
                pictures: nil
            )
            self.createOrderModel = createOrderModel
        }
    }
}

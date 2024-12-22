//
//  HomeViewModel.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var createOrderModel: CreateOrderModel
    @Published var showSelectPickUpTimeSheet: Bool = false

    @Published var timeOptions: [Option] = [
        Option(id: 1, title: "10-20 min", image: nil),
        Option(id: 2, title: "Up to 1 hour", image: nil),
        Option(id: 44, title: "Schedule delivery", image: .icSchedule)
    ]

    @Published var commodityOptions: [Option] = [
        Option(id: 1, title: "Agricultural Products", image: nil),
        Option(id: 2, title: "Raw Materials", image: nil),
        Option(id: 3, title: "Construction Materials", image: nil)
    ]

    init(createOrderModel: CreateOrderModel = CreateOrderModel.makeEmpty()) {
        self.createOrderModel = createOrderModel
        chageCreateOrder()
    }

    func changeTimeDateForSchedule(_ dateTime: DateTimeDTO?) {
        createOrderModel.deliveryDateTime = dateTime ?? DateTimeDTO(dateTime: "")
        if let dateTime = dateTime {
            timeOptions[2].title = dateTime.dateTime
            return
        }
        timeOptions[2].title = "Schedule delivery"
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

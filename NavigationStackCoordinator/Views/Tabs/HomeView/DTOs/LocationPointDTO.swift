//
//  LocationPoint.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 21/12/2024.
//

import Foundation

protocol LocationPoint: Identifiable {
    var id: Int { get }
    var latitude: Double { get }
    var longitude: Double { get }
    var title: String { get }
    var address: String { get }

    func makeParams() -> [String: Any]
    func getImage() -> ImageResource
    func getFullLocationTitle(_ index: Int) -> String
}

extension LocationPoint {
    func makeParams() -> [String: Any] {
        [
            "lat": latitude,
            "long": longitude
        ]
    }
}

struct PickUpLocationDTO: LocationPoint {
    let id: Int
    let latitude: Double
    let longitude: Double
    let title: String
    let address: String

    func getFullLocationTitle(_ index: Int) -> String {
        "Pickup \(index + 1): \(title)"
    }

    func getImage() -> ImageResource {
        .icRadioLocationPick
    }
}

struct DropOffLocationDTO: LocationPoint {
    let id: Int

    let latitude: Double
    let longitude: Double
    let title: String
    let address: String

    func getImage() -> ImageResource {
        .icLocationPin
    }

    func getFullLocationTitle(_ index: Int) -> String {
        "Drop-off : \(title)"
    }
}

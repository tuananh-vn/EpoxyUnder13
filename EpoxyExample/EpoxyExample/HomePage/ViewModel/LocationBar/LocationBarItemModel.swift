//
//  LocationBarItemModel.swift
//  DiscoveryUI
//
//  Created by Dong Tuan Anh on 29/04/2021.
//

import Foundation

enum ShippingLocation: String, CaseIterable {
    case HAN = "01"
    case DAD = "48"
    case SGN = "79"
    case All = "000000"
    
    static subscript(n: Int) -> ShippingLocation? {
        for (index, value) in ShippingLocation.allCases.enumerated() {
            if n == index {
                return value
            }
        }
        return nil
    }
    
    func toDescription() -> String {
        switch self {
        case .HAN:
            return "Hà Nội"
        case .DAD:
            return "Đà Nẵng"
        case .SGN:
            return "Hồ Chí Minh"
        default:
            return "Toàn quốc"
        }
    }
    
    func toStringInLocationBar() -> String {
        switch self {
        case .HAN, .DAD, .SGN:
            return String(format: "delivery_to".localized(), self.toDescription())
        case .All:
            return "delivery_nationwide".localized()
        }
    }
}

class LocationBarDataStore: BaseDataStore {
    var location: ShippingLocation
    typealias View = LocationBarViewCell
    
    init(from location: ShippingLocation) {
        self.location = location
    }
    
    func buildContent() -> LocationBarViewCell.Content {
        return LocationBarViewCell.Content(locationInfo: location.toStringInLocationBar())
    }
    
}

final class LocationBarItemModel: BaseItemModel {
    typealias DataStore = LocationBarDataStore
    
}

//
//  ListingModel.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import Foundation


struct ListingModel: Identifiable, Codable, Hashable {
    let id: String
    let ownerUID: String
    let ownerName: String
    let ownerImageURL: String
    
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    
    var pricePerNight: Double
    
    let imageURLs: [String]
    let latitude: Double
    let longitude: Double
    let address: String
    let state: String
    let city: String
    
    
    let title: String
    let rating: Double
    
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    
    let type: ListingType
}


enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn: "Self Check-in"
        case .superHost: "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn: "Check yourself in with the keypad"
            
        case .superHost: "Superhosts are experienced, highly rated hosts who are commited to providing great stars for guests"
        }
    }
    
    
    var id: Int { return self.rawValue}
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    
    var id: Int { return self.rawValue}
    
    case wifi
    case kitchen
    case laundry
    case office
    case balcony
    case tv
    case pool
    case alarmSystem
    case parking
    
    var title: String {
        switch self {
        case .pool:
            return "Pool"
        case .laundry:
            return "Laundry"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wifi"
        case .tv:
            return "TV"
        case .parking:
            return "Parking"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        case .alarmSystem:
            return "Alarm System"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .tv: return "tv"
        case .laundry: return "washer"
        case .parking: return "car"
        case .balcony: return "building"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        }
    }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var id: Int { return self.rawValue}
    
    var title: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town House"
        case .villa: return "Villa"
        }
    }
}

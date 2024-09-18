//
//  ListingModel.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import Foundation


struct ListingModel: Identifiable, Codable {
    let id: String
    let ownerUID: String
    let ownerName: String
    let ownerImageURL: String
    
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    
    var pricePerNight: Double
    
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    
    
    let title: String
    let rating: Double
}


enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
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
    
}

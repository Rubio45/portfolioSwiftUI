//
//  DeveloperPreview.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import Foundation

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    let mockListings: [ListingModel] = [
        ListingModel(
            id: UUID().uuidString,
            ownerUID: UUID().uuidString,
            ownerName: "John Doe",
            ownerImageURL: "host",
            numberOfBedrooms: 3,
            numberOfBathrooms: 2,
            numberOfGuests: 6,
            numberOfBeds: 3,
            pricePerNight: 120.00,
            imageURLs: ["listing-1", "listing-2", "listing-3"],
            latitude: 40.7128,
            longitude: -74.0060,
            address: "123 Main Street",
            state: "New York",
            city: "Manhattan",
            title: "Cozy Apartment in NYC",
            rating: 4.5,
            features: [.superHost, .selfCheckIn],
            amenities: [.wifi, .kitchen, .tv, .laundry, .balcony],
            type: .apartment
        ),
        ListingModel(
            id: UUID().uuidString,
            ownerUID: UUID().uuidString,
            ownerName: "Jane Smith",
            ownerImageURL: "host",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 8,
            numberOfBeds: 5,
            pricePerNight: 200.00,
            imageURLs: ["listing-3", "listing-2"],
            latitude: 34.0522,
            longitude: -118.2437,
            address: "456 Sunset Boulevard",
            state: "California",
            city: "Los Angeles",
            title: "Luxurious Villa in LA",
            rating: 4.9,
            features: [.superHost],
            amenities: [.wifi, .pool, .parking, .alarmSystem],
            type: .villa
        ),
        ListingModel(
            id: UUID().uuidString,
            ownerUID: UUID().uuidString,
            ownerName: "Michael Johnson",
            ownerImageURL: "host",
            numberOfBedrooms: 2,
            numberOfBathrooms: 1,
            numberOfGuests: 4,
            numberOfBeds: 2,
            pricePerNight: 80.00,
            imageURLs: ["listing-1", "listing-3"],
            latitude: 51.5074,
            longitude: -0.1278,
            address: "789 King's Road",
            state: "London",
            city: "London",
            title: "Charming House in London",
            rating: 4.3,
            features: [.selfCheckIn],
            amenities: [.wifi, .kitchen, .parking, .office],
            type: .house
        ),
        ListingModel(
            id: UUID().uuidString,
            ownerUID: UUID().uuidString,
            ownerName: "Emily Davis",
            ownerImageURL: "host",
            numberOfBedrooms: 5,
            numberOfBathrooms: 4,
            numberOfGuests: 10,
            numberOfBeds: 6,
            pricePerNight: 300.00,
            imageURLs: ["listing-2", "listing-4"],
            latitude: 48.8566,
            longitude: 2.3522,
            address: "101 Champs-Élysées",
            state: "Versalles",
            city: "Paris",
            title: "Elegant Town House in Paris",
            rating: 5.0,
            features: [.superHost, .selfCheckIn],
            amenities: [.wifi, .kitchen, .tv, .pool, .laundry, .parking],
            type: .townHouse
        )
    ]
}

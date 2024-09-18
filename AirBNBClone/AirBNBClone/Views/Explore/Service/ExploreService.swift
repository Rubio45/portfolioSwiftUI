//
//  ExploreService.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [ListingModel] {
        return DeveloperPreview.shared.mockListings
    }
}

//
//  ExploreViewModel.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var listings = [ListingModel]()
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Failed to fetch listings")
        }
    }
}

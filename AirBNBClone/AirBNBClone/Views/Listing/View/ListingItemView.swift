//
//  ListingView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: ListingModel
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView(listing: listing ,height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // listing details
            HStack (alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.address)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi Away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack (spacing: 2) {
                        Text(String(format: "$%.0f", listing.pricePerNight))
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        Text("night")
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
                
                // rating
                HStack() {
                    Image(systemName: "star.fill")
                    Text(String(format: "%.2f", listing.rating))
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.mockListings[0])
}

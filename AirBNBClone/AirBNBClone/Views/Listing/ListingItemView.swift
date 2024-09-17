//
//  ListingView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // listing details
            HStack (alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi Away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack (spacing: 2) {
                        Text("$567")
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
                    Text("4.86")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}

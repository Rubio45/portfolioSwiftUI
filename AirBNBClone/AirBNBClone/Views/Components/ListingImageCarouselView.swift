//
//  ListingImageCarouselView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let images = [
        "listing-3",
        "listing-2",
        "listing-1",
        "listing-4",
    ]
    
    var height: CGFloat
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: height)
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(height: 400)
}

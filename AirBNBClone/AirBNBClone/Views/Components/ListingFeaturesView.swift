//
//  ListingFeaturesView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

struct ListingFeaturesView: View {
    
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.title3)
            VStack (alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundStyle(.black)
                Text(description)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    ListingFeaturesView(image: "appletv", title: "Muy bueno", description: "exceltente condiciones para dormir tranquilo en alta mar y sirve para dormir y ver el televisor tranquilamente")
}

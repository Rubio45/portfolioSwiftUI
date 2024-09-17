//
//  ListingOfferingView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

struct ListingOfferingView: View {
    
    let image: String
    let title: String
    
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: image)
                .frame(width: 32)
            Text(title)
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundStyle(.black)
            
            Spacer()
        }
    }
}

#Preview {
    ListingOfferingView(image: "wifi", title: "Wi-Fi")
}

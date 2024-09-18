//
//  WishlistView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlist")
                        .font(.headline)
                    
                    Text("You can create, view and edit wishlists once you've logged in")
                        .font(.footnote)
                    
                    
                }.padding(.vertical)
                LoginButtonView(action: {
                    print("log in")
                })
                Spacer()
            }.padding()
                .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishlistView()
}

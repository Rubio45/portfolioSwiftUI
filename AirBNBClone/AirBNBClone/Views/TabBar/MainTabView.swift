//
//  MainTabView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import SwiftUI

struct MainTabView: View {
    
    
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            WishlistView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Wishlist")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainTabView()
}

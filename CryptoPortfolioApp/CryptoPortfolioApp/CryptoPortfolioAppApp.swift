//
//  CryptoPortfolioApp.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 21/8/24.
//

import SwiftUI

@main
struct CryptoPortfolioAppApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                    .environmentObject(viewModel)
            }
        }
    }
}

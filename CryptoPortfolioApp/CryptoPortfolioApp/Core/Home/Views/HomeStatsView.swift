//
//  HomeStatsView.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach($vm.statistics) { stat in //fix
                StatiticsView(stat: stat.wrappedValue)
            }
        }
            .padding(.horizontal)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
        .environmentObject(HomeViewModel())
}

//
//  StatiticsView.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import SwiftUI

struct StatiticsView: View {
    
    let stat: StatiticsModel
    
    var body: some View {
        VStack {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack (spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) > 0 ? 0 : 180))
                Text(String(format: "%.2f%%", stat.percentageChange ?? ""))
                    .font(.caption)
            }
            .bold()
            .foregroundStyle((stat.percentageChange ?? 0) > 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0 : 1)
        }
    }
}


#Preview {
    StatiticsView(stat: StatiticsModel(title: "MarketCap", value: "$219.21Bn", percentageChange: 39.22))
}

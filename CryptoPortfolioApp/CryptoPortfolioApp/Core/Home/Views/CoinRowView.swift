//
//  CoinRowView.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 21/8/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    
    var showHolding: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            AsyncImage(url: URL(string: coin.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                } else if phase.error != nil {
                    Image(systemName: "questionmark.circle")
                } else {
                    ProgressView()
                }
            }.frame(width: 32, height: 32)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .padding(.leading, 10)
            Spacer()
            if showHolding {
                VStack(alignment: .trailing) {
                    Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                        
                        .foregroundColor(Color.theme.accent)
                    Text(String(format: "%.2f", coin.currentHolding ?? 0))
                        .font(.subheadline)
                }
                .foregroundStyle(Color.theme.accent)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                Text(String(format: "%.2f", coin.priceChangePercentage24H ?? 0) + "%")
                    .bold()
                    .foregroundStyle(coin.priceChangePercentage24H ?? 0 > 0 ? Color.theme.green : Color.theme.red)
            }.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
            
    }
}

#Preview (traits: .sizeThatFitsLayout){
    Group {
        CoinRowView(coin: bitcoin, showHolding: false)
            .preferredColorScheme(.dark)
        
    }
        
}




#if DEBUG
let bitcoin = Coin(
    id: "bitcoin",
    symbol: "BTC",
    name: "Bitcoin",
    image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
    currentPrice: 62352.12,
    marketCap: 1200257424730.0,
    marketCapRank: 1,
    fullyDilutedValuation: 1250000000000.0,
    totalVolume: 35000000000.0,
    high24H: 61000.0,
    low24H: 59000.0,
    priceChange24H: 2000.0,
    priceChangePercentage24H: 3.45,
    marketCapChange24H: 70000000000.0,
    marketCapChangePercentage24H: 6.0,
    circulatingSupply: 18800000.0,
    totalSupply: 21000000.0,
    maxSupply: 21000000.0,
    ath: 65000.0,
    athChangePercentage: -7.69,
    athDate: "2023-11-10T00:00:00.000Z",
    atl: 65.0,
    atlChangePercentage: 92307.69,
    atlDate: "2013-07-06T00:00:00.000Z",
    lastUpdated: "2024-08-21T12:00:00.000Z",
    priceChangePercentage24HInCurrency: 3.45,
    sparklineIn7D: SparklineIn7D(price: [60000.0, 61000.0, 60500.0, 60000.0, 59500.0, 59000.0, 60000.0]),
    currentHolding: 1.5
)
#endif

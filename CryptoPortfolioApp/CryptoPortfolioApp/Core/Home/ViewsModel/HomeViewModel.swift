//
//  HomeViewModel.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject, Identifiable {
    
    @Published var statistics: [StatiticsModel] = []
    
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let coinDataService = CoinDataServices()
    private let marketDataService = MarketDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var searchText: String = ""
    @Published var sortOption: SortOption = .holdings
    
    enum SortOption {
        case rank, rankReversed, holdings, holdingsReversed
    }
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .map(filterCoin)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filterCoin(text: String, coin: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coin
        }
        let lowercasedText = text.lowercased()
        let filteredCoins = coin.filter { coin in
            return coin.name.lowercased().contains(lowercasedText) || coin.symbol.lowercased().contains(lowercasedText) || coin.id.lowercased().contains(lowercasedText)
        }
        return filteredCoins
    }
    
    private func mapGlobalMarketData(marketData: MarketData?) -> [StatiticsModel] {
        var stats: [StatiticsModel] = []
        
        guard let data = marketData else {
            return stats
        }
        
        let marketCap = StatiticsModel(title: "MarketCap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatiticsModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatiticsModel(title: "BTC Dominance", value: data.btcDominance)
        //let portfolioValue = StatiticsModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            //portfolioValue,
        ])
        
        return stats
    }
}

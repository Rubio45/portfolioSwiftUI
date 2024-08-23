//
//  HomeViewModel.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject, Identifiable {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let dataService = CoinDataServices()
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
            .combineLatest(dataService.$allCoins)
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .map(filterCoin)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
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
}

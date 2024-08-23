//
//  HomeView.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 21/8/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            //background
            Color.theme.background
                .ignoresSafeArea()
            // contenido
            VStack {
                HomeHeaderView(showPortfolio: $showPortfolio)
                
                HomeStatsView(showPortfolio: $showPortfolio)
                    .transition(.move(edge: showPortfolio ? .leading : .trailing))
                
                
                SearchBarView(searchText: $vm.searchText)
                
                VStack {
                    TitleCoinBar(showHolding: $showPortfolio)
                    if !showPortfolio {
                        List {
                            ForEach(vm.allCoins) { coin in
                                CoinRowView(coin: coin, showHolding: false)
                                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                            }
                        }.listStyle(PlainListStyle())
                            .transition(.move(edge: .leading))
                    }
                    
                    if showPortfolio {
                        List {
                            ForEach(vm.allCoins) { coin in
                                CoinRowView(coin: coin, showHolding: true)
                                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                            }
                        }.listStyle(PlainListStyle())
                            .transition(.move(edge: .trailing))
                    }
                    Spacer()
                }.frame(maxWidth: UIScreen.main.bounds.width)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
    .environmentObject(HomeViewModel())
    .preferredColorScheme(.dark)
}

struct HomeHeaderView: View {
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(isAnimated: $showPortfolio)
                )
            
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

struct TitleCoinBar: View {
    
    @Binding var showHolding: Bool
    
    var body: some View {
        HStack {
            Text("Coin")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .leading)
            Spacer()
            HStack (spacing: 4) {
                    Text("Holdings")
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                    Image(systemName: "chevron.down")
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                }
                .opacity(showHolding ? 1 : 0)
            VStack (alignment: .trailing) {
                HStack (spacing: 4) {
                    Text("Price")
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                    Image(systemName: "arrow.counterclockwise")
                        .font(.caption)
                }
            }.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }.padding(.horizontal)
    }
}

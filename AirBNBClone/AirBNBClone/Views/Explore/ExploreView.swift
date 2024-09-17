//
//  ExploreView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack {
            
            // adding the navigationSearchView
            if showDestinationSearchView {
                DestinationSearchView(isShowed: $showDestinationSearchView)
            } else {
                ScrollView {
                    LazyVStack(spacing: 32) {
                        
                        SearchAndFilterBar()
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    showDestinationSearchView.toggle()
                                }
                            }
                        
                        ForEach(0..<10) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }.padding()
                }.navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}

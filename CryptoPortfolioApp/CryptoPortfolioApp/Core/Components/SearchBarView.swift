//
//  SearchBarView.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    withAnimation(.linear(duration: 0.5)) {
                        searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                    }
                )
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .autocorrectionDisabled()
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()// shared es un singlenton de la aplicacion
                        }
                    ,alignment: .trailing
                )
            Spacer()
        }.font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
        .preferredColorScheme(.dark)
}

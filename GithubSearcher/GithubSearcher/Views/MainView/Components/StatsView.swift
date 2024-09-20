//
//  StatsView.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//

import SwiftUI

struct StatsView: View {
    
    var statsName: String
    var statsValue: String
    
    var body: some View {
        VStack {
            Text(statsValue)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(statsName)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
        }
    }
}


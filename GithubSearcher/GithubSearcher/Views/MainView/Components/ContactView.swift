//
//  ContactView.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//

import SwiftUI

struct ContactView: View {
    
    let image: String
    let name: String
    let value: String
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 4) {
                Image(systemName: image)
                    .frame(width: 40)
                    .foregroundStyle(.white)
                Text(name)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
            Text(value)
                .font(.subheadline)
                .bold()
                .lineLimit(1)
                .foregroundStyle(.white)
                .minimumScaleFactor(0.1)
        }
        .frame(width: 120, height: 90)
        .background(Color.backgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


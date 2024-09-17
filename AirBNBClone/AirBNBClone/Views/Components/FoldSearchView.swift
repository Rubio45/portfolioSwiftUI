//
//  FoldSearchView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

struct FoldSearchView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                
                Text(description)
                    .foregroundStyle(.black)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        // .padding()
        // .background(.white)
        // .clipShape(RoundedRectangle(cornerRadius: 12))
        // .padding()
        // .shadow(radius: 10)
    }
}

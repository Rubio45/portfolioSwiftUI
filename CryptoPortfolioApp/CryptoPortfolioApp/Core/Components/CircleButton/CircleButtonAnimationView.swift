//
//  CircleButtonAnimationView.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 21/8/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var isAnimated: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scaleEffect(isAnimated ? 1.0 : 0)
            .opacity(isAnimated ? 0.0 : 1.0)
            .animation(isAnimated ? Animation.easeInOut(duration: 0.6) : .none, value: isAnimated)
    }
}

#Preview {
    CircleButtonAnimationView(isAnimated: .constant(false))
}

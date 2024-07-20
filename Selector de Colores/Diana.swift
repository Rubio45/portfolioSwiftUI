//
//  Diana.swift
//  Selector de Colores
//
//  Created by Alex Diaz on 16/7/24.
//

import SwiftUI

struct Diana: View {
    var body: some View {
        VStack {
            Text("Diana de Ivancito")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(.black)
            
            ZStack {
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.orange)
                    .overlay(Circle().foregroundColor(.blue).frame(width: 250, height: 250))
                    .overlay(Circle().foregroundColor(.yellow).frame(width: 200, height: 200))
                    .overlay(Circle().foregroundColor(.green).frame(width: 150, height: 150))
                    .overlay(Circle().foregroundColor(.purple).frame(width: 100, height: 100))
                    .overlay(Circle().foregroundColor(.red).frame(width: 50, height: 50))

            }
        }
    }
}

#Preview {
    Diana()
}

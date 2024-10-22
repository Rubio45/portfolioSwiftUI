//
//  ContentView.swift
//  RollingNumbers
//
//  Created by Alex Diaz on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var targetValue: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                
                Button {
                    targetValue -= 1
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 50, height: 50)
                        .background(Color(.systemGray6), in: Circle())
                }
                .buttonRepeatBehavior(.enabled)
                
                RollingNumbersView(number: String(targetValue))
                    .scaleEffect(0.5)
                    .frame(width: 80)
                
                Button {
                    targetValue += 1
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 50, height: 50)
                        .background(Color(.systemGray6), in: Circle())
                }
                .buttonRepeatBehavior(.enabled)
            }
            .tint(.primary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

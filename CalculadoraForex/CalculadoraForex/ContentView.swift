//
//  ContentView.swift
//  CalculadoraForex
//
//  Created by Alex Diaz on 24/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            Text("Hello, World!")
                .tabItem {
                    Image(systemName: "calculator")
                    Text("Forex")
                }
            
        }
    }
}

#Preview {
    ContentView()
}

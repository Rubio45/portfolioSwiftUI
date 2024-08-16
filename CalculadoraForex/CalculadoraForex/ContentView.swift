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
                    Image(systemName: "coloncurrencysign.arrow.circlepath")
                    Text("Forex")
                        .font(.system(size: 18,weight: .bold, design: .rounded))
                }
            Text("Hola mundo")
                .tabItem {
                    Image(systemName: "coloncurrencysign.arrow.circlepath")
                    Text("Cripto")
                        .font(.system(size: 18,weight: .bold, design: .rounded))
                }
            
            Text("Signals")
                .tabItem {
                    Image(systemName: "coloncurrencysign.arrow.circlepath")
                    Text("Signals")
                        .font(.system(size: 18,weight: .bold, design: .rounded))
                }.ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}

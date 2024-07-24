//
//  ContentView.swift
//  EBay3D
//
//  Created by Alex Diaz on 23/7/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack {
            TabView{
                HomeView().tabItem { Label("Home", systemImage: "house") }
                Text("Hola Ivan").tabItem { Label("My Products", systemImage: "bag") }
                Text("Hello Futures").tabItem {
                    Label("Chat", systemImage: "ellipsis.message.fill")
                }
                Text("hello Wallet").tabItem { Label("My Account", systemImage: "person.circle.fill") }
            }
        }
        .padding()
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

/* Model3D(named: "Scene", bundle: realityKitContentBundle)
     .padding(.bottom, 50)*/
// reality kit COntent bundle para llamar objetos 3D

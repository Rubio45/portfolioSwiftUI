//
//  EBay3DApp.swift
//  EBay3D
//
//  Created by Alex Diaz on 23/7/24.
//

import SwiftUI

@main
struct EBay3DApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}

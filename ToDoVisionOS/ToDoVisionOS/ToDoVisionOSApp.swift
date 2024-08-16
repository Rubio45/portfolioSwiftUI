//
//  ToDoVisionOSApp.swift
//  ToDoVisionOS
//
//  Created by Alex Diaz on 23/7/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoVisionOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: ToDoList.self)
    }
}

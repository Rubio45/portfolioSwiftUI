//
//  Task.swift
//  ToDOAPP IOS
//
//  Created by Alex Diaz on 15/8/24.
//

import Foundation
import SwiftUI

enum Priority: Int, CaseIterable {
    case low = 1
    case medium = 2
    case high = 3
    
    //return the string of the priority
    func toString() -> String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
    func color () -> Color {
        switch self {
            case .low:
                return Color.green
            case .medium:
                return Color.orange
            case .high:
                return Color.red
        }
    }
}
// modelo de los datos, cuando se marca Observable marca todas las variables como published. 
@Observable class Task: Identifiable {
    var id: UUID
    var name: String
    var priority: Priority
    var isCompleted: Bool
    
    init(name: String = "", priority: Priority = .medium, completed: Bool = false) {
        self.id = UUID()
        self.name = name
        self.priority = priority
        self.isCompleted = completed
    }
}

//
//  Task.swift
//  ToDOAPP IOS
//
//  Created by Alex Diaz on 15/8/24.
//

import Foundation
import SwiftUI
import SwiftData

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
@Model class Task: Identifiable {
    var id: UUID
    var name: String
    @Transient var priority: Priority { //es una propiedad transiente, no se almacena en la base de datos, sino que se almacena el atribute asociado
        get {
            return Priority(rawValue: Int(self.priorityNum)) ?? .medium
        } set {
            self.priorityNum = Int(newValue.rawValue)
        }
    }
    @Attribute(originalName: "priority") var priorityNum: Priority.RawValue
    
    var isCompleted: Bool
    
    init(name: String = "", priority: Priority = .medium, completed: Bool = false) {
        self.id = UUID()
        self.name = name
        self.isCompleted = completed
        self.priorityNum = priority.rawValue
        self.priority = priority
    }
}

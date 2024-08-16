//
//  Models.swift
//  ToDoVisionOS
//
//  Created by Alex Diaz on 23/7/24.
//

import Foundation
import SwiftData

@Model
class ToDoList {
    var title: String
    
    @Relationship
    var items: [ToDoItem] = []
    
    init(title: String) {
        self.title = title
    }
}

@Model
class ToDoItem {
    var title: String
    var isDone: Bool = false
    
    init(title: String) {
        self.title = title
    }
}

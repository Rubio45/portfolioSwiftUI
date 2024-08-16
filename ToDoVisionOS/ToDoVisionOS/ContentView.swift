//
//  ContentView.swift
//  ToDoVisionOS
//
//  Created by Alex Diaz on 23/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query var toDoLists: [ToDoList] = []
    @State private var selectedToDoList: ToDoList? = nil
    
    @State private var showAddListAlert: Bool = false
    @State private var newListTitle: String = ""
    
    var body: some View {
        NavigationSplitView {
            List(toDoLists) { list in
                Button(list.title) {
                    selectedToDoList = list
                }
            }
            .navigationTitle("To Do Lists")
            .toolbar {
                Button("Add") {
                    showAddListAlert.toggle()
                }
            }
            .alert("Add ToDo List",isPresented: $showAddListAlert) {
                TextField("List Title", text: $newListTitle)
                Button("Cancel", role: .cancel, action: {})
                Button("Create") {
                    let list = ToDoList(title: newListTitle)
                    modelContext.insert(list)
                    
                }
            }
        } detail: {
            if let selectedToDoList = selectedToDoList {
                ToDoListView(list: selectedToDoList)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView().modelContainer(for: ToDoList.self)
}

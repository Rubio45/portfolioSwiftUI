//
//  ToDoListView.swift
//  ToDoVisionOS
//
//  Created by Alex Diaz on 23/7/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State var list: ToDoList
  
    @State private var showAddToDoAlert: Bool = false
    @State private var newItemTitle: String = ""
    
    var body: some View {
        
        List {
            Section("To Do") {
                ForEach(list.items.filter { !$0.isDone }) { item in
                    HStack{
                        Button {
                            withAnimation {
                                item.isDone.toggle()
                            }
                        } label: {
                            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        }
                        
                        Text(item.title)
                        Spacer()
                    }
                }
            }
            Section("Done") {
                ForEach(list.items.filter { $0.isDone }) { item in
                    HStack{
                        Button {
                            withAnimation {
                                item.isDone.toggle()
                            }
                        } label: {
                            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        }
                        
                        Text(item.title)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Details for \(list.title)")
        .toolbar {
            Button {
                showAddToDoAlert.toggle()
            } label: {
                Text("Add Item")
            }
        }
        .alert("Add ToDo Title", isPresented: $showAddToDoAlert) {
            TextField("Item Title", text: $newItemTitle)
            Button("Cancel", role: .cancel, action: {})
            Button("Create") {
                let item = ToDoItem(title: newItemTitle)
                list.items.append(item)
                modelContext.insert(item)
                newItemTitle = "" // Reset the title field
            }
        }
        .id(list.id)
    }
}

#Preview (windowStyle: .automatic) {
    ToDoListView(list: ToDoList(title: "Test List")).modelContainer(for: ToDoList.self)
}

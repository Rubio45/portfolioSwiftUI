//
//  NewTaskView.swift
//  ToDOAPP IOS
//
//  Created by Alex Diaz on 16/8/24.
//

import SwiftUI

struct NewTaskView: View {
    
    @Binding var isShow: Bool
    
    @State var newTaskTitle: String
    @State var newTaskPriority: Priority
    @State var isEditing = false
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            //Cabecera
            HStack {
                Text("Add a New Task")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Spacer()
                Button {
                    withAnimation {
                        self.isShow.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                }
            }.padding()
            
            //Formulario
            VStack {
                // para las tareas
                TextField("Task Name", text: self.$newTaskTitle) { editingChanged in
                    withAnimation {
                        self.isEditing = editingChanged
                    }
                }
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 20)
                // para las prioridades
                
                Text("Priority")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                HStack {
                   ForEach(Priority.allCases, id: \.self) { priority in
                        PriorityCell(newTaskPriority: self.$newTaskPriority, priority: priority)
                    }
                }
                
            }.padding(10)
            
            // boton de guardar
            Button {
                if self.newTaskTitle.trimmingCharacters(in: .whitespaces) == "" {
                    return
                }
                withAnimation {
                    self.isShow = false
                }
                self.addNewTask(title: self.newTaskTitle, priority: self.newTaskPriority)
            } label: {
                Text("Save")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.bottom, 20)
        }.padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .offset(y: self.isEditing ? -320: 0)
            .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addNewTask(title: String, priority: Priority, isCompleted: Bool = false) {
        let newTask = Task(name: title, priority: priority, completed: isCompleted)
        modelContext.insert(newTask)
    }
}
#Preview {
    NewTaskView(isShow: .constant(true), newTaskTitle: "", newTaskPriority: .medium)
}


struct PriorityCell: View {
    
    @Binding var newTaskPriority: Priority
    
    var priority: Priority
    
    var body: some View {
        Text(priority.toString())
            .font(.system(size: 20, design: .rounded))
            .padding()
            .background( newTaskPriority == priority ? self.newTaskPriority.color() : Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.bottom, 20)
            .onTapGesture {
                self.newTaskPriority = priority
            }
            .animation(.bouncy(), value: self.newTaskPriority)
    }
}

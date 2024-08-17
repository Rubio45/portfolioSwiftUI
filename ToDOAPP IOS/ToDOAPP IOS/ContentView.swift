//
//  ContentView.swift
//  ToDOAPP IOS
//
//  Created by Alex Diaz on 15/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    //cargar las tareas desde la base de datos, SQLite y ordenarlas.
    @Query(sort: \Task.priorityNum, order: .reverse) var tasks: [Task]
    
    //MARK: - CREAR NUEVA TAREA
    @State private var newTaskTitle: String = ""
    @State private var newTaskPriority: Priority = .medium
    
    @State private var showNewTask = false
    
    //MARK: - FILTRAR
    @State private var isShowingFilterView = false
    @State private var priorityToFilter: Priority = Priority.medium
    //MARK: - Buscar
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("To Do List")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                    
                    Button {
                        withAnimation {
                            self.showNewTask.toggle()
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30))
                            .rotationEffect(Angle(degrees: self.showNewTask ? 45 : 0))
                    }
                }.padding()
                HStack {
                    SearchView(searchText: self.$searchText)
                    Button {
                        withAnimation {
                            isShowingFilterView.toggle()
                        }
                    } label: {
                        //filtrar
                        Image(systemName: isShowingFilterView ? "xmark" : "slider.horizontal.3")
                            .font(.system(size: 30))
                    }
                }
                .padding(.horizontal)
                .padding(.top , -16)
                    
                
                List {
                    
                    //MARK: mostrar las tareas
                    
                    ForEach(self.tasks.filter({searchText.isEmpty ? true : $0.name.contains(searchText)})) { task in
                        //TODO: hacer una fila en la lista
                        TaskCell(task: task)
                    }.onDelete { indexSet in
                        self.deleteTask(indexSet: indexSet)
                    }
                }
                .listStyle(.plain)
                .rotation3DEffect(
                     Angle(degrees: self.showNewTask ? 8 : 0),
                     axis: (x: 1, y: 0, z: 0)
                 )
                .offset(y: self.showNewTask ? -40 : 0)
                .animation(.easeInOut, value: self.showNewTask)
                .onAppear {
                    UITableView.appearance().separatorColor = .clear
                }
                
                if self.tasks.count == 0 {
                    NoTaskView()
                }
                
                if self.showNewTask {
                    //TODO: CREAR EL FORMULARIO DE NUEVA TAREA
                    
                    NewTaskView(isShow: self.$showNewTask, newTaskTitle: "", newTaskPriority: .medium)
                        .transition(.move(edge: .bottom))
                        .animation(.interpolatingSpring(stiffness: 100, damping: 20.0, initialVelocity: 10.0), value: self.showNewTask)
                }
            }
        }.sheet(isPresented: $isShowingFilterView) {
            //TODO: Filtrar por prioridad y completados
        }
        
    }
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet{
            let taskToDelete = self.tasks[index]
            modelContext.delete(taskToDelete)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
//arreglar la contentView
@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Task.self,
                                           configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for index in 1...5 {
            let task = Task(name: "Task \(index)", priority: .medium)
            container.mainContext.insert(task)
        }
        
        return container
    } catch {
        fatalError("Error al crear el contenedor")
    }
}()

struct NoTaskView: View {
    var body: some View {
        VStack {
            
            Text("No Task Yet :(")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            
        }
    }
}

#Preview("No task :)") {
   NoTaskView()
}

struct TaskCell: View {
    
    @Bindable var task: Task
    
    var body: some View {
        VStack {
            Toggle(isOn: $task.isCompleted, label: {
                HStack {
                    Text(task.name)
                        .font(.system(.callout, design: .rounded))
                        .strikethrough(task.isCompleted, color: .gray)
                        .bold()
                    Spacer()
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(task.priority.color())
                }
            }).toggleStyle(CheckBoxStyle())
        }.padding()
    }
}

struct CheckBoxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 25))
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .onTapGesture {
                    // cambiar la configuracion del toggle
                    configuration.isOn.toggle()
                }
            // devolver el label
            configuration.label
        }
    }
    
}

#Preview("Task Cell") {
    TaskCell(task: Task(name: "Task 1"))
}

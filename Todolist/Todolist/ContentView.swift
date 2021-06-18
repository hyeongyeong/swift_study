//
//  ContentView.swift
//  Todolist
//
//  Created by 현경 on 2021/06/18.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)])
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks) { task in
                    Text(task.title ?? "Untitled")
                        .onTapGesture (
                            count: 1, perform: {
                                updateTask(task)
                            }
                        )
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: Button("Add Task"){
                addTask()
            })
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    private func updateTask(_ task: FetchedResults<Task>.Element){
        withAnimation{
            task.title = "Updated"
            saveContext()
        }
    }
    
    private func addTask(){
        withAnimation{
            let newTask = Task(context: viewContext)
            newTask.title = "New Task \(Date())"
            newTask.date = Date()
            
            saveContext()
        }
    }

    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Persistence.swift
//  Todolist
//
//  Created by 현경 on 2021/06/18.
//

import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "TodoList")
        
        container.loadPersistentStores{(NSPersistentStoreDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
}

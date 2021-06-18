//
//  TodolistApp.swift
//  Todolist
//
//  Created by 현경 on 2021/06/18.
//

import SwiftUI

@main
struct TodolistApp: App {
    var body: some Scene {
        let persistenceContainer = PersistenceController.shared
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}

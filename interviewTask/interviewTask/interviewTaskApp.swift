//
//  interviewTaskApp.swift
//  interviewTask
//
//  Created by Varshitha VRaj on 02/09/25.
//

import SwiftUI

@main
struct interviewTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

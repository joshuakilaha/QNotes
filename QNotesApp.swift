//
//  QNotesApp.swift
//  QNotes
//
//  Created by mroot on 07/04/2022.
//

import SwiftUI

@main
struct QNotesApp: App {
    
    //initating DataController Object
    @StateObject private var noteDataController = NoteDataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //Seting the environment value of DataController path.
                .environment(\.managedObjectContext, noteDataController.container.viewContext)
        }
    }
}

//
//  NoteDataController.swift
//  QNotes
//
//  Created by mroot on 07/04/2022.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

class NoteDataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "NoteModel")
    
    //MARK: -Load Notes
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to Load Notes \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: -Save notes
    
    /**
     saveNote - Function to save the written note to SQLite
        @context:
     */
    func saveNote(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Note Saved Successfully")
        } catch {
            print("Unable to save the Note")
        }
    }
    
    //MARK: -Add note
    
    /**
     addNote - function to add a note
     @topic
     @subject
     @notes
     */
    func addNote(context: NSManagedObjectContext, topic: String, subject: String, notes: String, imageN: Data){
        
        let note = Note(context: context)
        
        note.id = UUID()
        note.topic = topic
        note.subject = subject
        note.notes = notes
        note.date = Date()
        note.imageN = imageN
        
        print("\(String(describing: note.imageN)) Image Added")
        saveNote(context: context)
    }
    
    //MARK: -Update notes
    
    /**
     editNote - function to edit and update a note
     @topic
     @subject
     @notes
     */
    func editNote(context: NSManagedObjectContext,note: Note, topic: String, subject: String, notes: String, imageN: Data)  {
        
        note.topic = topic
        note.subject = subject
        note.notes = notes
        note.date = Date()
        note.imageN = imageN
        
        saveNote(context: context)
    }
    
}

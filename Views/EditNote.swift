//
//  EditNote.swift
//  QNotes
//
//  Created by mroot on 07/04/2022.
//

import SwiftUI

struct EditNote: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var topic = ""
    @State private var subject = ""
    @State private var note = ""
    
    var notes: FetchedResults<Note>.Element
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                Form {
                    Section(header: Text("Topic").fontWeight(.heavy).foregroundColor(.blue)) {
                        TextField("Topic", text: $topic)
                            .font(.title)
                    }
                    
                    Section(header: Text("Subject").fontWeight(.heavy).foregroundColor(.blue)) {
                        TextField("Subject", text: $subject)
                    }

                    Section(header: Text("Notes").fontWeight(.heavy).foregroundColor(.blue)) {
                        TextEditor(text: $note)
                            .frame( height: 400)
                    }
                }
                .onAppear {
                    topic = notes.topic!
                    subject = notes.subject!
                    note = notes.notes!
              }
            }
            .navigationBarHidden(true)
        }
            .navigationViewStyle(.stack)
        
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button ("Update") {
                    NoteDataController().editNote(context: managedObjContext, note: notes, topic: topic, subject: subject, notes: note)
                    dismiss()
                }
            }
        }
    }
}


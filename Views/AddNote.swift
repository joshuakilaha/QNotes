//
//  AddNote.swift
//  QNotes
//
//  Created by mroot on 07/04/2022.
//

import SwiftUI


struct AddNote: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    @State private var topic = ""
    @State private var subject = ""
    @State private var note = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .topLeading) {
                Form {
                    Section {
                       TextField("Topic", text: $topic)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        TextField("Subject", text: $subject)
                    }
                    
                    Section(header: Text("Notes")) {
                        TextEditor(text: $note)
                            .frame( height: 400)
                    }
                }
    
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Done") {
                        NoteDataController().addNote(context: managedObjContext, topic: topic, subject: subject, notes: note)
                        dismiss()
                    }
                }
            }
            
        }
       
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote()
    }
}

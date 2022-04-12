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
    @State private var image: Data? = .init(count: 0)
   // @State private var imageN: Data
    
    @State private var show = false //add icon
    
    var notes: FetchedResults<Note>.Element
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                Form {
                    
                    Section(header: Text("Image")) {
                        
                        //MARK: -To DO (condition to check nots.imageN ✅
                        Button {
                            self.show.toggle()
                        } label: {

                                Image(data: self.image, placeholder: "noImage")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(6)
                        }
                        
                    }
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
                    //MARK: Handle optional image ✅
                    image = notes.imageN
              }
            }
            .navigationBarHidden(true)
        }
            .navigationViewStyle(.stack)
        
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button ("Update") {
                    NoteDataController().editNote(context: managedObjContext, note: notes, topic: topic, subject: subject, notes: note, imageN: image)
                    dismiss()
                }
            }
        }
        
        //MARK: Image Picker from photos
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
    }
}

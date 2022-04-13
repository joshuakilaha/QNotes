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
    @State private var image: Data? = .init(count: 0)
    
    @State private var show = false
    
    var body: some View {
        
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.title3)
                            .frame(width: 80, height: 30)
                    }
                    Spacer()
                    
                    Button {
                        NoteDataController().addNote(context: managedObjContext, topic: topic, subject: subject, notes: note, imageN: image)
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 70, height: 30)
                    }
                } .padding()
                Form {
                    Section(header: Text("Image")) {
                    
                        //MARK: -TO DO  ADD progress bar

                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(data: self.image, placeholder: "noImage")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(6)
                        }
                    }
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
        
        //MARK: Image Picker from photos
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote()
    }
}

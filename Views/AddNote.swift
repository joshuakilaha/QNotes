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
    @State private var image: Data = .init(count: 0)
    
    @State private var show = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .topLeading) {
                Form {
                    Section(header: Text("Image")) {
                        if self.image.count > 0 {
                            Button(action: {
                                self.show.toggle()
                            }) {
                                //MARK: -TO DO  ADD progress bar
                                Image(uiImage: UIImage(data: self.image)!)
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(6)
                                
                                
                            }
                        } else {
                            Button(action: {
                                self.show.toggle()
                            }) {
                                Image(systemName: "photo.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(.gray)
                            }
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
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Done") {
                        //MARK: Add Note
                        NoteDataController().addNote(context: managedObjContext, topic: topic, subject: subject, notes: note, imageN: image)
                        dismiss()
                    }
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

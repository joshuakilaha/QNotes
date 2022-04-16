//
//  ContentView.swift
//  QNotes
//
//  Created by mroot on 07/04/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var note: FetchedResults<Note>
    
    @State private var showingAddView = false //add icon
    
    var body: some View {
        
        NavigationView {
                VStack(alignment: .leading) {
                    Spacer()
                    List {
                         ForEach(note) { note in
                             NavigationLink(destination: EditNote(notes: note)) {
                                 NoteCell(topic: note.topic!, subject: note.subject!, imageN: note.imageN, date: note.date!)
                             }
                         }
                         .onDelete(perform: deleteNote)
                     } .listStyle(.plain)
                 }
                .navigationTitle("Quick Notes")
            }
        .navigationViewStyle(.stack)
        
        .toolbar {
            
            //MARK: -Edit button
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            
            //MARK: ADD Note
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Spacer ()
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Note", systemImage: "square.and.pencil")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddView) {
            AddNote()
        }
    }
    
    //MARK: -Delete Note
    private func deleteNote(offsets: IndexSet) {
        withAnimation {
            offsets.map{(note[$0])} .forEach(managedObjContext.delete)
        }
        NoteDataController().saveNote(context: managedObjContext)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
                                 HStack{
                                     if note.imageN == nil {
                                         Image("noImage")
                                             .resizable()
                                            .frame(width: 70, height: 70)
                                     }
                                      else {
                                          //MARK: - To DO (Optional Image fix) ✅
                                          Image(data: note.imageN, placeholder: "noImage")
                                              .resizable()
                                             .frame(width: 70, height: 70)
                                      }
                                     VStack(alignment: .leading, spacing: 6) {
                                         Text(note.topic!)
                                             .fontWeight(.black)
                                             .bold()
                                             
                                         
                                         Text(note.subject!)
                                             .fontWeight(.light)
                                             .italic()
                                             
                                     }
                                     Spacer()
                                     Text(calcTimeSince(date: note.date!))
                                         .foregroundColor(.gray)
                                         .italic()
                                 }
                             }
                         }
                         .onDelete(perform: deleteNote)
                     } .listStyle(.plain)
                 }
                .onAppear{
                    UINavigationBarAppearance().setColor(title: .blue, background: .white)
                }
                .navigationTitle("Quick Notes")
                
            }
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


//MARK: -Navigation Appearance

extension UINavigationBarAppearance {
    func setColor(title: UIColor? = nil, background: UIColor? = nil) {
        configureWithTransparentBackground()
        if let titleColor = title {
            largeTitleTextAttributes = [.foregroundColor: titleColor]
            titleTextAttributes = [.foregroundColor: titleColor]
        }
        backgroundColor = background
        UINavigationBar.appearance().scrollEdgeAppearance = self
        UINavigationBar.appearance().standardAppearance = self
    }
}

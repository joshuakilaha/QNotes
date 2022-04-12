//
//  ImageView.swift
//  QNotes
//
//  Created by mroot on 08/04/2022.
//

import SwiftUI

struct ImageView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var note: FetchedResults<Note>
    

    var body: some View {
        HStack {
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
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        ImageView()
    }
}

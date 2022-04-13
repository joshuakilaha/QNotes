//
//  NoteCell.swift
//  QNotes
//
//  Created by mroot on 13/04/2022.
//

import SwiftUI

struct NoteCell: View {
    let topic: String
    let subject: String
    let imageN: Data?
    let date: Date
    
    var body: some View {
        HStack{
        Image(data: imageN, placeholder: "noImage")
            .resizable()
           .frame(width: 70, height: 70)
            VStack {
                Text(topic)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .bold()
                Text(subject)
                    .font(.title2)
                    .fontWeight(.light)
            }
            Spacer()
        Text(calcTimeSince(date:date))
                .font(.subheadline)
                .foregroundColor(.secondary)
                .italic()
        }
    }
}

struct NoteCell_Previews: PreviewProvider {
    static var previews: some View {
        let data = "noImage".data(using: .utf8)
        NoteCell(topic: "Food", subject: "Protein", imageN: data, date: Date())
    }
}

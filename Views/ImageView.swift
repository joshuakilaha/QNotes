//
//  ImageView.swift
//  QNotes
//
//  Created by mroot on 08/04/2022.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        HStack {
            Image("car")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            VStack {
                Text("topic")
                    .font(.title)
                Text("title")
            }
            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("4 minutes ago")
           
            
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        ImageView()
    }
}

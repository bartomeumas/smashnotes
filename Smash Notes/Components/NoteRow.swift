//
//  NoteRow.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 3/11/23.
//

import SwiftUI

struct NoteRow: View {
    @State var note: Note
    
    var body: some View {
        HStack {
            Text(note.playerName)
                .frame(maxWidth: 100, alignment: .leading)
            Divider()
            HStack {
                            ForEach(Array(note.mains as! Set<String>).prefix(3), id: \.self) { main in
                                Image(main)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
    }
}


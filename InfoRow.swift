//
//  InfoRow.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 29.09.2024.
//

import SwiftUI

struct InfoRow: View {
    
    let post: Film
    @Binding var rowHeight: Double
    
    var body: some View {
        HStack {
            post.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: $rowHeight.wrappedValue, height: $rowHeight.wrappedValue)
            
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.title3)
                    
                if post.isWatched {
                    Text("Просмотрено")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(post: FilmStore().films[1], rowHeight: .constant(40))
    }
}

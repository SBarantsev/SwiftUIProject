//
//  InfoDetails.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 29.09.2024.
//

import SwiftUI

struct InfoDetails: View {
    
    let post: Film
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                post.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(post.title)
                    .font(.largeTitle)
                Text(post.description)
            }
            .padding()
        }
//        .navigationTitle(post.title)
    }
}

struct InfoDetails_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetails(post: FilmStore().films[1])
    }
}

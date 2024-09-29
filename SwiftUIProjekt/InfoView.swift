//
//  InfoView.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 27.09.2024.
//

import SwiftUI

struct InfoView: View {
    
    let posts: [Post]
    
    var body: some View {
        
        NavigationView {
            List(posts, id: \.id) { post in
                NavigationLink(destination: InfoDetails(post: post)) {
                    InfoRow(post: post)
                }
            }
            .navigationTitle("Top films")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(posts: PostData.posts)
    }
}

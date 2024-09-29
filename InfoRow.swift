//
//  InfoRow.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 29.09.2024.
//

import SwiftUI

struct InfoRow: View {
    
    let post: Post
    
    var body: some View {
        HStack {
            post.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(post.title)
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(post: PostData.posts[1])
    }
}

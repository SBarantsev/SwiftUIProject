//
//  InfoRow.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 29.09.2024.
//

import SwiftUI

struct InfoRow: View {
    
    let post: Post
    @Binding var rowHeight: Double
    
    var body: some View {
        HStack {
            post.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: $rowHeight.wrappedValue, height: $rowHeight.wrappedValue)
            Text(post.title)
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(post: PostData.posts[1], rowHeight: .constant(40))
    }
}

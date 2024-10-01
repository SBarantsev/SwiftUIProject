//
//  InfoView.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 27.09.2024.
//

import SwiftUI

struct InfoView: View {
    
    var titleOn: Bool
    @Binding var rowHeight: Double
    
    let posts: [Post]
    
    var body: some View {
        
        NavigationView {
            List(posts, id: \.id) { post in
                NavigationLink(destination: InfoDetails(post: post)) {
                    InfoRow(post: post, rowHeight: $rowHeight)
                }
            }
            .navigationTitle("Top films")
            .listStyle(.plain)
            .toolbar(titleOn ? .visible : .hidden)
        }
    }
}

struct InfoView_Previews: PreviewProvider {

    static var previews: some View {
        InfoView(titleOn: false, rowHeight: .constant(40), posts: PostData.posts)
    }
}

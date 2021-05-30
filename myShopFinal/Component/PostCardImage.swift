//
//  PostCardImage.swift
//  myShopFinal
//
//  Created by oontoon on 5/30/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct PostCardImage: View {
    
    var post: PostModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("username : " + post.username).font(.headline)
            Text("Category : " + post.category)
            Text("Detail : " + post.caption)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            WebImage(url: URL(string: post.mediaUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width, height:
                        400, alignment: .center)
                .clipped()
            
            
        }
    }
}


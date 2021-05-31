//
//  PostCardImage.swift
//  myShopFinal
//
//  Created by oontoon on 5/30/21.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseFirestore



struct PostCardImage: View {
    @StateObject var removeservice = RemoveService()
    var post: PostModel
    
    var body: some View {
        
        VStack(alignment: .leading){
            WebImage(url: URL(string: post.mediaUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 200, idealWidth: 400, maxWidth: 600, minHeight: 200, idealHeight: 400, maxHeight: 400, alignment: .center)
                .clipped()
            VStack{
                Text(post.username).font(.headline).frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                Text(post.category).frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                Text(post.caption).frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            }
            Button(action: {Firestore.firestore().collection("posts").document("gDwhwFCJh9Ms2HG8S6x2").delete()}) {
                Text("Delete")
                    .foregroundColor(Color.white)
                    .padding()
            }
            .background(RoundedRectangle(cornerRadius: 10   , style: .continuous)).padding(.leading, 16)
            .padding(.bottom, 16)
            .padding(.leading, 16)
                
        }
        .background(Color("Color"))
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding(.leading, 20)

            // right padding
            .padding(.trailing, 20)
            
            // top padding
            .padding(.top, 20)
            
            // bottom padding
            .padding(.bottom, 20)
    }
}


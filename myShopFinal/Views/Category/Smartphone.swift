//
//  Smartphone.swift
//  myShopFinal
//
//  Created by oontoon on 5/29/21.
//

import SwiftUI
import FirebaseAuth
struct Smartphone: View {
    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()
    var txt = "SmartPhone"
    
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: Post()){
                    Text("Add Post")
                }
                ForEach(self.profileService.posts.filter{$0.category.lowercased().contains(self.txt.lowercased())}, id:\.postID ) {
                    (post) in
                    PostCardImage(post: post)
                    
                }
            }
        }.navigationTitle("")
        .onAppear(){
            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
        }
        
    }
}

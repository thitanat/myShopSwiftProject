//
//  ProfileService.swift
//  myShopFinal
//
//  Created by oontoon on 5/30/21.
//

import Foundation
import Firebase
import SwiftUI

class ProfileService: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    func loadUserPosts(userId: String) {
        PostService.loadUserPosts(userId: userId) {
            (posts) in
            
            self.posts = posts
        }
    }
}

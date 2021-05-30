//
//  ProfileService.swift
//  myShopFinal
//
//  Created by oontoon on 5/30/21.
//

import Foundation
import Firebase
import SwiftUI

//ใช้ในการ load post เฉพาะของ user ใน session ที่ login อยู่
class ProfileService: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    func loadUserPosts(userId: String) {
        PostService.loadUserPosts(userId: userId) {
            (posts) in
            
            self.posts = posts
        }
    }
}

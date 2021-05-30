//
//  LoadAllService.swift
//  myShopFinal
//
//  Created by oontoon on 5/30/21.
//

import Foundation
import Firebase
import SwiftUI

//ใช้ในการโหลด post ของ user ทุกๆคน
class LoadAllService: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    func loadAll() {
        PostService.loadAll() {
            (posts) in
            
            self.posts = posts
        }
    }
}


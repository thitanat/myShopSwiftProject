//
//  RemoveService.swift
//  myShopFinal
//
//  Created by oontoon on 5/31/21.
//

import Foundation
import Firebase
import FirebaseStorage

class RemoveService: ObservableObject {
    private let db = Firestore.firestore()
    
    @Published var post: [PostModel] = []
    private let collectionName = "posts"
    
   
    func remove(post : PostModel) {
            db.collection(collectionName).document(post.postID).delete()
            { err in
                if let err = err {
                  print("Error removing document: \(err)")
                }
                else {
                  print("Document successfully removed!")
                }
            }
        }
   
}

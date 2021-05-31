//
//  UpdateProductService.swift
//  myShopFinal
//
//  Created by oontoon on 5/31/21.
//

import Foundation
import Firebase
import FirebaseStorage

class UpdateProductService: ObservableObject {
    private let db = Firestore.firestore()
    
    @Published var postmodel: [PostModel] = []
    private let collectionName = "posts"
    
   
    func upDateProduct(id: String){
        db.collection(collectionName).document(id).updateData([
            "name": "Done"
        ]) { error in
            print(error ?? "Update failed.")
        }

    }
    
   
}


//
//  PostModel.swift
//  myShopFinal
//
//  Created by oontoon on 5/29/21.
//

import Foundation
struct PostModel: Encodable, Decodable {
    var caption: String
    var ownerID: String
    var postID: String
    var username : String
    var profile: String
    var mediaUrl: String
    var category: String
    var allPost : String
}

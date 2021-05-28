//
//  UserModel.swift
//  myShopFinal
//
//  Created by oontoon on 5/28/21.
//

import Foundation

struct User: Encodable, Decodable {
    var uid: String
    var email:String
    var profileImageUrl : String
    var username : String
    var searchName : [String]
    var bio : String
}

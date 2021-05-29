//
//  SessionStore.swift
//  myShopFinal
//
//  Created by oontoon on 5/28/21.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth


class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet{self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen(){
        handle = Auth.auth().addStateDidChangeListener({
            (auth, user) in
            
            if let user = user{
            
                let fireStoreUserId = AuthService.getUserId(userId: user.uid)
                fireStoreUserId.getDocument{
                    (document, error) in
                    if let dict = document?.data(){
                        guard let decodedUser = try? User.init(fromDictionary: dict) else {return}
                        self.session = decodedUser
                    }
                }
            }
            else {
                self.session = nil
            }
        })
    }
    
    func logout() {
        do{
            try Auth.auth().signOut()
        } catch{
            
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
        
}


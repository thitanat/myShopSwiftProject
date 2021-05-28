//
//  SignUpView.swift
//  myShopFinal
//
//  Created by oontoon on 5/28/21.
//

import SwiftUI

struct SignUpView: View {
    
   
    @State private var username: String = ""
    @State private var cpassword: String = "" //confrim password
    @State private var password: String = ""
    @State private var email: String = ""
    
    
    var body: some View {
        VStack(spacing: 15){
            Text("Email")
            TextField("", text: $email)        //email field
                .padding(6.5)
                .overlay(RoundedRectangle(cornerRadius: 100)
                .stroke(Color.black, lineWidth: 1))  // frame block email form
            
            Text("Password")
            SecureField("", text: $password)   //password field
                .padding(6.5)
                .overlay(RoundedRectangle(cornerRadius: 100)
                .stroke(Color.black, lineWidth: 1))  // frame block password form
            
            Text("Comfirm Password")
            SecureField("", text: $cpassword)  //password comfirm field
                .padding(6.5)
                .overlay(RoundedRectangle(cornerRadius: 100)
                .stroke(Color.black, lineWidth: 1))  // frame block password comfirm form
            
            Text("Username")
            TextField("", text: $username)         //username field
                .padding(6.5)
                .overlay(RoundedRectangle(cornerRadius: 100)
                .stroke(Color.black, lineWidth: 1)) 
            
        }.padding()
        Button(action:{
        }){Text("Finish")}
    }
}

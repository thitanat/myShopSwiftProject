//
//  SignInView.swift
//  myShopFinal
//
//  Created by oontoon on 5/28/21.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView{
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 32){
            
            Image("MyShop")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(20)  // Logo
            
            Text("MyShop").font(.system(size: 45.0))
            
            TextField("Enter Email", text: $email)   //username field
                .padding(6.5)
                .overlay(RoundedRectangle(cornerRadius: 100)
                .stroke(Color.black, lineWidth: 1))  // frame block username form
            
            SecureField("Enter Password", text: $password)  //password field
                .padding(6.5)
                .overlay(RoundedRectangle(cornerRadius: 100)
                .stroke(Color.black, lineWidth: 1))  // frame block password form
            
            Button(action: {}){
                Text("Login")
            }

            HStack{
                Text("New?")
                NavigationLink(destination: SignUpView()){
                    Text("Create an Account").font(
                        .system(size: 20, weight:
                                .semibold))
                }
            }
            
        }
            
        }.padding()
    }
}

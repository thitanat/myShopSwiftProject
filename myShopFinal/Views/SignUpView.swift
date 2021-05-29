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
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var alertTitle: String = "ลงทะเบียนไม่ผ่าน"
    @State private var imageData: Data = Data()
    @State private var sourceType:
        UIImagePickerController.SourceType = .photoLibrary
    
    func loadImage() {
        guard let inputImage = pickedImage else {
            return
        }
        
        profileImage = inputImage
    }
    
    //------------------ErrorCheck----------------------------------------
    func errorCheck()-> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty ||
            username.trimmingCharacters(in: .whitespaces).isEmpty{
            
            return "กรุณากรอกข้อมูลให้ครบ"
        }
        return nil
    }
    
    func clear(){
        self.email = ""
        self.password = ""
        self.username = ""
    }
    //--------------------------------------------------------------------
    //-------------------signUpFunction------------------------------------
    
    func signUp(){
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        
        AuthService.signUp(username: username, email: email, password: password, imageData: imageData , onSuccess: {
            (user) in
            self.clear()
        }) {
            (errorMessage) in
            print("Error \(errorMessage)")
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
    
    
    //---------------------------------------------------------------------
    
    
    var body: some View {
        ScrollView{
            VStack(spacing: 15){
                VStack{
                      if profileImage != nil{
                            profileImage!.resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .onTapGesture {
                                    
                                }
                        }
                        else{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .onTapGesture {
                                    
                                }
                        }
                    
                }
                Group{
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
                                
                }
                Button(action: signUp)
                {
                    Text("Finish")}.alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                    }
            }.padding()
            
        }/*.sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }.actionSheet(title: Text(""), button: [
                        .default(Text("Choose A Photo")){
                            self.sourceType = .photoLibrary
                            self.showingImagePicker = true
                        },
                        .default(Text("Take a photo")){
                            self.sourceType = .camera
                            self.showingImagePicker = true
                        },.cancel()
            
        ])*/
        
    }
}

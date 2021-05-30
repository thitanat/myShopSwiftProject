//
//  HomeView.swift
//  myShopFinal
//
//  Created by oontoon on 5/28/21.
//



import SwiftUI
import FirebaseAuth
struct HomeView: View {
    
        let uid = Auth.auth().currentUser!.uid
    @EnvironmentObject var session: SessionStore
    var body: some View {
        
        NavigationView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                NavigationLink(destination: ProductPage()){
                    Text("My post").navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                Text("Recommended !!!").font(.system(size: 35.0))
                recommendation()
                CategoryList()
            }
        }
        Button(action: session.logout){
            Text("Log out")
        }
    }
}

struct recommendation : View {
    var body: some View {
        RecommendedProduct()
    }
}

struct CategoryList : View{
    var body: some View {
        List {
            NavigationLink(destination: Car()){
                HStack{
                    Text("Car")
                }
            }
            NavigationLink(destination: Smartphone()){
                HStack{
                    Text("Smart Phone")
                }
            }
            NavigationLink(destination: Fashion()){
                HStack{
                    Text("Fashion")
                }
            }
        }
    }
}

//--------------------------------------- card corosal-------------------

struct RecommendedProduct : View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 20
    @State var op : CGFloat = 0
    
    @State var data = [
        
        Frame(id: 0, img: "iPad Air 4", name: "iPad Air 4", show: false),
        Frame(id: 1, img: "iPhone 12 Pro", name: "iPhone 12 Pro", show: false),
        Frame(id: 2, img: "Tricolor", name: "NMD Tricolor", show: false),
        Frame(id: 3, img: "Click", name: "Honda Click", show: false),
        
    ]
    
    var body : some View{
        
        NavigationView{
            VStack{
                HStack(spacing: 15){
                    ForEach(data){i in
                        FrameView(data: i)
                            .offset(x: self.x)
                            .highPriorityGesture( DragGesture()
                                .onChanged({ (value) in
                                    if value.translation.width > 0{
                                        self.x = value.location.x
                                    }
                                    else{
                                        self.x = value.location.x - self.screen
                                    }
                                })
                                .onEnded({ (value) in
                                if value.translation.width > 0{
                                    if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                        self.count -= 1
                                        //self.updateHeight(value: Int(self.count))
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                                else{
                                    if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                            self.count += 1
                                            //self.updateHeight(value: Int(self.count))
                                            self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                            })
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 380)
                .offset(x: self.op)
                
            }
            .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.bottom))
            .animation(.spring())
            .onAppear {
                
                self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                
                self.data[0].show = true
            }
        }
    }
    
    /*func updateHeight(value : Int){
        
        for i in 0..<data.count{
            data[i].show = false
        }
        data[value].show = true
    }*/
}

struct FrameView : View {
    
    var data : Frame
    var body : some View{
    
        VStack(alignment: .leading, spacing: 0){
            Image(data.img)
                .resizable()
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .padding(.leading)
            
        }
        .frame(width: UIScreen.main.bounds.width - 20, height: 410)
        .background(Color.white) // change bg to white from red
        .cornerRadius(25)
    }
}

struct Frame : Identifiable {
    
    var id : Int
    var img : String
    var name : String
    var show : Bool
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

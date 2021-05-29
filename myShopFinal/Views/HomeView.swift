//
//  HomeView.swift
//  myShopFinal
//
//  Created by oontoon on 5/28/21.
//

import SwiftUI

import SwiftUI
struct HomeView : View {
    @EnvironmentObject var session: SessionStore
    @State var data = [
        
        Card(id: 0, img: "p1", name: "Product1", show: false),
        Card(id: 1, img: "p2", name: "Product2", show: false),
        Card(id: 2, img: "p3", name: "Product3", show: false),
        Card(id: 3, img: "p4", name: "Product4", show: false),
        Card(id: 4, img: "p5", name: "Product5", show: false),
        Card(id: 5, img: "p6", name: "Product6", show: false),
        Card(id: 6, img: "p7", name: "Product7", show: false)
        
    ]
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15){
                NavigationLink(destination: HomeView()){
                    Text("All Product").navigationBarTitle("")
                        .navigationBarHidden(true)
                }
                Button(action: session.logout){
                    Text("Log out")
                }
                recommendation()
                CategoryList()
                
            }
            
        }
    }
}


/* struct tabBar : View{
 var body: some View {
 Image("tab bar")
 .resizable()
 .aspectRatio(19/4 ,contentMode: .fit) // 19/4 is scale tab bar
 }
 } */

struct recommendation : View {
    var body: some View {
        RecommendedProduct()
        
    }
}

struct CategoryList : View{
    var body: some View {
        List {
            NavigationLink(destination: HomeView()){
                HStack{
                    Text("Car")
                }
            }
            NavigationLink(destination: HomeView()){
                HStack{
                    Text("Smart Phone")
                }
            }
            NavigationLink(destination: HomeView()){
                HStack{
                    Text("Fashion")
                }
            }
            NavigationLink(destination: HomeView()){
                HStack{
                    Text("")
                }
            }
            
            
            
            
        }
    }
}

//--------------------------------------- card corosal-------------------

struct RecommendedProduct : View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var op : CGFloat = 0
    
    @State var data = [
        
        Card(id: 0, img: "example", name: "Sunglasses", show: false),
        Card(id: 1, img: "example2", name: "Dog", show: false),
        Card(id: 2, img: "p3", name: "Product3", show: false),
        Card(id: 3, img: "p4", name: "Product4", show: false),
        Card(id: 4, img: "p5", name: "Product5", show: false),
        Card(id: 5, img: "p6", name: "Product6", show: false),
        Card(id: 6, img: "p7", name: "Product7", show: false)
        
    ]
    
    var body : some View{
        
        NavigationView{
            
            VStack{
                
                
                HStack(spacing: 15){
                    
                    ForEach(data){i in
                        
                        CardView(data: i)
                            .offset(x: self.x)
                            .highPriorityGesture(DragGesture()
                                                    
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
                                                                self.updateHeight(value: Int(self.count))
                                                                self.x = -((self.screen + 15) * self.count)
                                                            }
                                                            else{
                                                                
                                                                self.x = -((self.screen + 15) * self.count)
                                                            }
                                                        }
                                                        else{
                                                            
                                                            
                                                            if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                                                
                                                                self.count += 1
                                                                self.updateHeight(value: Int(self.count))
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
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.op)
                
            }
            .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("Recommended Product")
            .animation(.spring())
            .onAppear {
                
                self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                
                self.data[0].show = true
            }
        }
    }
    
    func updateHeight(value : Int){
        
        
        for i in 0..<data.count{
            
            data[i].show = false
        }
        
        data[value].show = true
    }
}

struct CardView : View {
    
    var data : Card
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            
            Image(data.img)
                .resizable()
            
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 13)
                .padding(.leading)
            
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 250 : 220)
        .background(Color.red)
        .cornerRadius(25)
    }
}

struct Card : Identifiable {
    
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

//
//  ContentView.swift
//  myShopFinal
//
//  Created by oontoon on 5/29/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func listen(){
        session.listen()
    }
    
    var body: some View {
     
        Group{
            if(session.session != nil) {
                //Text("Logged In")
                HomeView()
            } else {
                SignInView()
            }
        }.onAppear(perform: listen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



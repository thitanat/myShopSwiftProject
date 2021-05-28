//
//  myShopFinalApp.swift
//  myShopFinal
//
//  Created by oontoon on 5/28/21.
//

import SwiftUI
import Firebase

@main
struct myShopFinalApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        print("Firebase...")
        FirebaseApp.configure()
        return true
    }
}

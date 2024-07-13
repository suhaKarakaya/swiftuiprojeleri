//
//  SwiftUIFirebaseBootcampApp.swift
//  SwiftUIFirebaseBootcamp
//
//  Created by Süha Karakaya on 1.03.2024.
//

import SwiftUI
import Firebase

@main
struct SwiftUIFirebaseBootcampApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
           RootView()
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

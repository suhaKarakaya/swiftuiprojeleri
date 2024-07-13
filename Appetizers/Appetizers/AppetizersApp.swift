//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Süha Karakaya on 4.01.2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}

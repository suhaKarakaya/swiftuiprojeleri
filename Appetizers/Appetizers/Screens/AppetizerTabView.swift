//
//  ContentView.swift
//  Appetizers
//
//  Created by Süha Karakaya on 4.01.2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    //                    Image(systemName: "house")
                    //                    Text("Home")
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }.badge(order.orderCount())
        }
        //        .accentColor(.brandPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}

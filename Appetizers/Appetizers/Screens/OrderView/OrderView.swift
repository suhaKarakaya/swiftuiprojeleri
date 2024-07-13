//
//  OrderView.swift
//  Appetizers
//
//  Created by Süha Karakaya on 4.01.2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    //                .listStyle(GroupedListStyle())
                    //                .listStyle(InsetGroupedListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
                        Text("$\(order.totalPrice(), specifier: "%.2f") - Placed Order")
                    }
//                    .modifier(StandartButtonStyle())
                    .standartButtonStyle()
                    .padding(.bottom, 25)
                    
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer!")
                }
                
            }
            .navigationTitle("🍽️ Order")
        }
    }
    
   
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

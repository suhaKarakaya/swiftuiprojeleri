//
//  Order.swift
//  Appetizers
//
//  Created by Süha Karakaya on 6.02.2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func totalPrice() -> Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func orderCount() -> Int {
        items.count
    }
}

//
//  StandartCustomStyle.swift
//  Appetizers
//
//  Created by Süha Karakaya on 8.02.2024.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standartButtonStyle() -> some View{
        self.modifier(StandartButtonStyle())
    }
}

//
//  XDissmisButton.swift
//  Appetizers
//
//  Created by Süha Karakaya on 8.01.2024.
//

import SwiftUI

struct XDissmisButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
                
        }
    }
}

struct XDissmisButton_Previews: PreviewProvider {
    static var previews: some View {
        XDissmisButton()
    }
}

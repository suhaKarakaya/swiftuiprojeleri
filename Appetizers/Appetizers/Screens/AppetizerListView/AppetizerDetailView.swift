//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Süha Karakaya on 8.01.2024.
//

import SwiftUI

struct AppetizerDetailView: View {
     
    @EnvironmentObject var order: Order
    @Binding var isShoiwingDetail: Bool
    var appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(key: "Colories", value: "\(appetizer.calories)")
                    
                    NutritionInfo(key: "Carbs", value: "\(appetizer.carbs)")
                    
                    NutritionInfo(key: "Protein", value: "\(appetizer.protein)")
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShoiwingDetail = false
            } label: {
//                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                
            }
            .modifier(StandartButtonStyle())
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShoiwingDetail = false
        }, label: {
            XDissmisButton()
        }), alignment: .topTrailing)
    }
    

}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(isShoiwingDetail: .constant(true), appetizer: MockData.sampleAppetizer)
    }
}

struct NutritionInfo: View {
    var key: String
    var value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(key)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

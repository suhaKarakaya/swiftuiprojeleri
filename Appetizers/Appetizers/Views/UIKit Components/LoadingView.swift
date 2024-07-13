//
//  LoadingView.swift
//  Appetizers
//
//  Created by Süha Karakaya on 8.01.2024.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        activityIndicatorView.isUserInteractionEnabled = false
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
        ActivityIndicator()
        }
    }
}

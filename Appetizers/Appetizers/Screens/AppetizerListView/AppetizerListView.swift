//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Süha Karakaya on 4.01.2024.
//

import SwiftUI

struct AppetizerListView: View {

    @StateObject var viewModel = AppetizersListViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
//                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetailView)
            }
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(isShoiwingDetail: $viewModel.isShowingDetailView, appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

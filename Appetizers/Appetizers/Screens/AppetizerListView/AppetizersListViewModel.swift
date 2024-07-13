//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Süha Karakaya on 8.01.2024.
//

import Foundation

@MainActor final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers(){
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
    
    
    //    func getAppetizers(){
    //        isLoading = true
    //        NetworkManager.shared.getAppetizers { result in
    //            DispatchQueue.main.async {
    //                self.isLoading = false
    //                switch result {
    //                case.success(let response):
    //                    self.appetizers = response
    //                    break
    //                case .failure(let error):
    //                    switch error {
    //                    case.invalidData:
    //                        self.alertItem = AlertContext.invalidData
    //                        break
    //                    case.invalidResponse:
    //                        self.alertItem = AlertContext.invalidResponse
    //                        break
    //                    case.invalidURL:
    //                        self.alertItem = AlertContext.invalidURL
    //                        break
    //                    case.unableToComplete:
    //                        self.alertItem = AlertContext.unableToComplete
    //                        break
    //                    }
    //                }
    //            }
    //        }
    //    }
}

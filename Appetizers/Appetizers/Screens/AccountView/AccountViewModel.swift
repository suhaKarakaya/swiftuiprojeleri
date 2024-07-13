//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Süha Karakaya on 2.02.2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    
    @Published var firstName       = ""
    @Published var lastName        = ""
    @Published var email           = ""
    @Published var birthdate       = Date()
    @Published var extraNapkins    = false
    @Published var frequentRefills = false
    @Published var alertItem: AlertItem?
    
    func saveChanges(){
        guard isValidForm else { return }
        do {
            var user = User()
            user.firstName = firstName
            user.lastName = lastName
            user.email = email
            user.birthdate = birthdate
            user.extraNapkins = extraNapkins
            user.frequentRefills = frequentRefills
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData = userData else { return }
        do {
            var user = User()
            user = try JSONDecoder().decode(User.self, from: userData)
            firstName = user.firstName
            lastName = user.lastName
            email = user.email
            birthdate = user.birthdate
            extraNapkins = user.extraNapkins
            frequentRefills = user.frequentRefills
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false }
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false }
        
        return true
        
    }
    
   
}

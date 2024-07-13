//
//  SignInEmailView.swift
//  SwiftUIFirebaseBootcamp
//
//  Created by Süha Karakaya on 1.03.2024.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No found email or password")
            return }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No found email or password")
            return }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}


struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        VStack {
            
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        
                    }
                    
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return 
                    } catch {
                        
                    }
                }
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.red)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInEmailView(showSignInView: .constant(true))
    }
}

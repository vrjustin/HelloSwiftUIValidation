//
//  LoginView.swift
//  HelloValidation
//
//  Created by Justin Maronde on 8/28/24.
//

import SwiftUI

struct LoginState {
    var email: String = ""
    var password: String = ""
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func clearErrors() {
        emailError = nil
        passwordError = nil
    }
    
    mutating func isValid() -> Bool {
        clearErrors()
        
        if email.isEmpty {
            emailError = LoginError.emailEmpty
        } else if !email.isValidEmail {
            emailError = LoginError.emailInvalid
        }
        
        if password.isEmpty {
            passwordError = LoginError.passwordEmpty
        }
        
        return emailError == nil && passwordError == nil
    }
}

struct LoginView: View {
    
    @State private var loginState = LoginState()
    
    var body: some View {
        Form {
            TextField("Email", text: $loginState.email)
                .textInputAutocapitalization(.never)
            if let emailError = loginState.emailError {
                Text(emailError.localizedDescription)
            }
            
            SecureField("Password", text: $loginState.password)
            if let passwordError = loginState.passwordError {
                Text(passwordError.localizedDescription)
            }

            Button("Login") {
                if loginState.isValid() {
                    //perform login.
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

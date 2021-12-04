//
//  LoginViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 03/12/21.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth
import FacebookCore
import FacebookLogin

protocol LoginViewModelDelegate {
    
}

class LoginViewModel {
    
    func getUserData() -> User {
        let firebaseAuth = Auth.auth()
        if let user = firebaseAuth.currentUser {
            let name = user.displayName ?? ""
            let email = user.email ?? ""
            let authenticatedUser = User(displayName: name, email: email)
            print("===*===*===*===\(authenticatedUser)===*===*===*===")
            return authenticatedUser
        }
        return User(displayName: "", email: "")
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Erro ao fazer logout")
        }
        // Logout Facebook
        let loginManager = LoginManager()
        loginManager.logOut() // this is an instance function
    }
}

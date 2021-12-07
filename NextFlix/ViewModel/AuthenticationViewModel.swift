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


protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?

    // Computed property: A variável será verdadeira se seguir a condição
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
    
//    func getUserData() -> User {
//        let firebaseAuth = Auth.auth()
//        if let user = firebaseAuth.currentUser {
//            let name = user.displayName ?? ""
//            let email = user.email ?? ""
//            let authenticatedUser = User(displayName: name, email: email)
//            print("===*===*===*===\(authenticatedUser)===*===*===*===")
//            return authenticatedUser
//        }
//        return User(displayName: "", email: "")
//    }
//
//    func logOut() {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("Erro ao fazer logout")
//        }
//        // Logout Facebook
//        let loginManager = LoginManager()
//        loginManager.logOut() // this is an instance function
//    }
}

struct RegistrationViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
    
    
}

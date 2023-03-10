//
//  LoginViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 03/12/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FacebookCore
import FacebookLogin
import FBSDKCoreKit

enum SistemaLogin {
    case google
    case facebook
    case email
}

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
    
    func getUserData() -> Any {
        
        switch userFrom() {
            case .email:
                let firebaseUser = Auth.auth().currentUser
                let name = firebaseUser?.displayName ?? ""
                let email = firebaseUser?.email ?? ""
                let authenticatedUser = User(displayName: name, email: email)
                print("===*===*===*===\(authenticatedUser)===*===*===*===")
                return authenticatedUser
            case .facebook:
                return User(displayName: "", email: "")
            case .google:
            return User(displayName: "", email: "")
////                let googleUser = GIDSignIn.sharedInstance()?.currentUser
////                let name = googleUser?.profile.givenName ?? ""
////                let email = googleUser?.profile.email ?? ""
//                return User(displayName: name, email: email)
        }
    }
    
    private func userFrom() -> SistemaLogin {
        if Auth.auth().currentUser != nil {
            return .email
        } else if AccessToken.isCurrentAccessTokenActive {
            return .facebook
        }
        
        return .google
    }
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

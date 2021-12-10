//
//  AuthService.swift
//  NextFlix
//
//  Created by Thiago Leite on 07/12/21.
//

import UIKit
import Firebase
import FirebaseAuth


struct AuthCredentials {
    let email: String
    let password: String
}

struct AuthService {
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        print("DEBUG: Credentials are \(credentials)")
        
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let data: [String: Any] = ["email": credentials.email, "uid": uid]
            
            Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
     
        }
    }
}

//
//  ProfileViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 03/12/21.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var loggedUserLbl: UILabel!
    
    private let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = loginViewModel.getUserData()
        loggedUserLbl.text = user.displayName
    }
    

    

}

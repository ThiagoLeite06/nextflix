//
//  LoginViewController.swift
//  NextFlix
//
//  Created by Gui Feitosa on 21/10/21.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth
import FacebookCore
import FacebookLogin
import AVFoundation

class LoginViewController: UIViewController {
    
    private var viewModel = LoginViewModel()
    
    private let registerScreen = RegisterScreenViewController()
    
    @IBOutlet var signInButton: GIDSignInButton!
    @IBOutlet var signInFbButtonContainer: UIView!
    
    @IBOutlet weak var logoUIImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationObservers()
        // Google Login
        GIDSignIn.sharedInstance().presentingViewController =  self
        GIDSignIn.sharedInstance().delegate = self
        
        // viewModel.logOut()
        
        // Facebook Login
        let fbLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile])
        fbLoginButton.frame = signInFbButtonContainer.bounds
        
        signInFbButtonContainer.addSubview(fbLoginButton)
        fbLoginButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        fbLoginButton.delegate = self
        
        if let accessToken = AccessToken.current {
            print(">>>> Usuário logado")
            print(accessToken)
        }
        
        loginButton.isEnabled = viewModel.formIsValid
        loginButton.backgroundColor =  #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).withAlphaComponent(0.5)
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        
        
    }
    
    func loginFacebookFirebase(accessToken: String) {
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
        
        Auth.auth().signIn(with: credential) { result, error in
            if let error = error {
                print("deu ruim")
            }
            
            print("Login com firebase")
            print(result)
            
            if let user = Auth.auth().currentUser {
                print("usuario é \(user)")
            }
            
            self.performSegue(withIdentifier: "showTabBar", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            print("DEBUG: Email change")
            viewModel.email = sender.text
        } else {
            print("DEBUG: Password change")
            viewModel.password = sender.text
        }
        
        updateForm()
        
    }
    
    // MARK: - Login with User and Password
    
    @IBAction func loginButton(_ sender: Any) {
        print("Login tapped!")
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [ weak self ] result, error in
            guard error == nil else {
                print("DEBUG: User not found!!")
                return
            }
            print("Login successfully")
            self?.performSegue(withIdentifier: "showTabBar", sender: nil)
        }
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        performSegue(withIdentifier: "RegisterDetail", sender: nil)
    }
    
}

// MARK: - Login Google

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard
            let authentication = user.authentication,
            let idToken = authentication.idToken else { return }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Algo deu errado! \(error)")
                return
            }
            //            let userInfo = viewModel.getUserData()
                        self.performSegue(withIdentifier: "showTabBar", sender: nil)
        }
    }
    
    
}

// MARK: - Login Facebook

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        switch result {
        case .none:
            print("um erro aconteceu")
        case .some(let loginResult):
            print(loginResult.grantedPermissions)
            print(loginResult.declinedPermissions)
            print(loginResult.isCancelled)
            print(loginResult.token)
            if let token = loginResult.token?.tokenString {
                loginFacebookFirebase(accessToken: token)
                self.performSegue(withIdentifier: "showTabBar", sender: nil)
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Efetuou logout")
    }
}

extension LoginViewController: FormViewModel {
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
    }
}

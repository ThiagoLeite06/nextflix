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
    
    private let registerScreen = RegisterScreenViewController()
    
    @IBOutlet var signInButton: GIDSignInButton!
    
    @IBOutlet weak var logoUIImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaLabel: UILabel!
    @IBOutlet weak var senhaTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().presentingViewController =  self
        GIDSignIn.sharedInstance().delegate = self
        
        if isUserLogged() {
            logOut()
        }
        
        let fbLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile])
        fbLoginButton.center = view.center
        fbLoginButton.delegate = self
        
        self.view.addSubview(fbLoginButton)
        
        if let accessToken = AccessToken.current {
            print(">>>> Usuário logado")
            print(accessToken)
        }
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
        }
    }
    
    
    
    func getUserData() {
        let firebaseAuth = Auth.auth()
        guard let user = firebaseAuth.currentUser else {
            return
        }
        print("Informações do usuário")
        print("nome: \(user.displayName ?? "")")
        print("email: \(user.email ?? "")")
        

    }
    
    func isUserLogged() -> Bool {
        let firebaseAuth = Auth.auth()
        let user = firebaseAuth.currentUser
        
        if user != nil {
            getUserData()
            return true
        } else {
            return false
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Erro ao fazer logout")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func logarButton(_ sender: Any) {
        
        if (emailTextField.text == "admin@nextflix.com.br" && senhaTextField.text == "Teste@123") {
            
            performSegue(withIdentifier: "showTabBar", sender: self)
            
//            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                if segue.identifier == "showTabBar" {
//                    if segue.destination is MoviesViewController {
//                        performSegue(withIdentifier: "showTabBar", sender: self)
//                    }
//                }
            }
        
        textFieldsVazio()
        emailTextFieldVazio()
        senhaTextFieldVazio()
        
        }
        
//        textFieldsVazio()
//        emailTextFieldVazio()
//        senhaTextFieldVazio()
//    }
    
    private func textFieldsVazio(){
        if (emailTextField.text!.isEmpty && senhaTextField.text!.isEmpty) {
            
            let alert = UIAlertController(title: "Ops", message: "Favor informar login e/ou Senha", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { myAlert in
                self.retiraTintaBordaTextFields()
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            pintaTextFields()
        }
    }
    
    private func emailTextFieldVazio(){
        if (emailTextField.text!.isEmpty) {
            
            let alert = UIAlertController (title: "", message: "Favor informar o Login", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { myAlert in
                self.retiraTintaBordaTextFields()
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            pintaTextFieldEmail()
        }
    }
    
    private func senhaTextFieldVazio() {
        if (senhaTextField.text!.isEmpty) {
            
            let alert = UIAlertController (title: "", message: "Favor informar o Senha", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { myAlert in
                self.retiraTintaBordaTextFields()
                
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            pintaTextFieldSenha()
        }
    }
    
    private func pintaTextFields() {
        emailTextField.layer.borderColor = UIColor.red.cgColor
        emailTextField.layer.borderWidth = 2
        senhaTextField.layer.borderColor = UIColor.red.cgColor
        senhaTextField.layer.borderWidth = 2
    }
    
    private func pintaTextFieldEmail() {
        emailTextField.layer.borderColor = UIColor.red.cgColor
        emailTextField.layer.borderWidth = 2
    }
    
    private func pintaTextFieldSenha() {
        senhaTextField.layer.borderColor = UIColor.red.cgColor
        senhaTextField.layer.borderWidth = 2
    }
    
    private func retiraTintaBordaTextFields() {
        self.emailTextField.layer.borderColor = UIColor.clear.cgColor
        self.senhaTextField.layer.borderColor = UIColor.clear.cgColor
    }
    
    
    @IBAction func registrarButton(_ sender: Any) {
        performSegue(withIdentifier: "RegisterDetail", sender: RegisterScreenViewController())
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "RegisterDetail" {
                if let register = sender as? Register {
                    if let proximaTela = segue.destination as? RegisterScreenViewController {
                        proximaTela.register = register
                    }
                }
            }
        }
    }
    
    
    @IBAction func loginGmailButton(_ sender: Any) {
    }
    
    @IBAction func loginFacebookButton(_ sender: Any) {
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard
            let authentication = user.authentication,
            let idToken = authentication.idToken else { return }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error { return }
            self.getUserData()
            self.performSegue(withIdentifier: "showTabBar", sender: nil)
        }
    }
    
    
}

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Efetuou login")
        
        switch result {
        case .none:
            print("um erro aconteceu")
        case .some(let loginResult):
//            loginResult.grantedPermissions
//            loginResult.declinedPermissions
//            loginResult.isCancelled
//            loginResult.token
            if let token = loginResult.token?.tokenString {
                loginFacebookFirebase(accessToken: token)
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Efetuou logout")
    }
    
    
}

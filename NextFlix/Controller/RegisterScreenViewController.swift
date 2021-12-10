//
//  RegisterScreenViewController.swift
//  NextFlix
//
//  Created by Gui Feitosa on 21/10/21.
//

import UIKit

class RegisterScreenViewController: UIViewController {
    
    var register: Register?
    
    private var viewModel = RegistrationViewModel()

    @IBOutlet weak var logoImageView: UIImageView!
   
    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationObservers()
        
        signUpButton.isEnabled = viewModel.formIsValid
        signUpButton.backgroundColor =  #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).withAlphaComponent(0.5)
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
   
    }
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let credentials = AuthCredentials(email: email, password: password)
        
        AuthService.registerUser(withCredential: credentials) { error in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully registered user with firestore")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction private func backButton() {
        dismiss(animated: true, completion: nil)
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
}

extension RegisterScreenViewController: FormViewModel {
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}


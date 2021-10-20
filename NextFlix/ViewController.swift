//
//  ViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 12/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let registerScreen = RegisterScreenViewController()
    
    @IBOutlet weak var logoUIImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaLabel: UILabel!
    @IBOutlet weak var senhaTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    
    @IBAction func loginButton(_ sender: Any) {
        
        if (emailTextField.text == "guilherme@teste.com.br" && senhaTextField.text == "Teste123@") {
            performSegue(withIdentifier: "", sender: self)
        }
        
        textFieldsVazio()
        emailTextFieldVazio()
        senhaTextFieldVazio()
    }
    
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
    
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        
        //        performSegue(withIdentifier: "RegisterDetail", sender: RegisterScreenViewController())
        
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




//
//  RegisterScreenViewController.swift
//  NextFlix
//
//  Created by Gui Feitosa on 21/10/21.
//

import UIKit

class RegisterScreenViewController: UIViewController {
    
    var register: Register?
    
    private let regiterViewModel = RegisterViewModel()

    @IBOutlet weak var logoUIImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaLabel: UILabel!
    @IBOutlet weak var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regiterViewModel.delegate = self
        
    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        let register = Register(email: emailTextField.text ?? "", senha: senhaTextField.text ?? "")
        regiterViewModel.registro(register: register)
        
    }
    
    @IBAction private func voltarButton(_ sender: Any) {
        navigationController?.viewControllers.popLast()
        
//        dismiss(animated: true)
    }
    
}

extension RegisterScreenViewController: RegisterViewModelDelegate {
    func registerResult(register: Register) {
        
        let alert = UIAlertController(title: "", message: "Cadastro Concluído com Sucesso!!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { myAlert in
            self.limpaTextField()
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func limpaTextField () {
        emailTextField.text = ""
        senhaTextField.text = ""
    }
}

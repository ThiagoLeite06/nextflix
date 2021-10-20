//
//  RegisterScreenViewController.swift
//  NextFlix
//
//  Created by Gui Feitosa on 18/10/21.
//

import UIKit

class RegisterScreenViewController: UIViewController {
    
    var register: Register?
    
    @IBOutlet weak var logoUIImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaLabel: UILabel!
    @IBOutlet weak var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        
        
    }
    
    @IBAction private func voltarButton(_ sender: Any) {
        navigationController?.viewControllers.popLast()
        
//        dismiss(animated: true)
    }
    
}

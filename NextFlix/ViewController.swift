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
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
//
//        performSegue(withIdentifier: "RegisterDetail", sender: RegisterScreenViewController())
//
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




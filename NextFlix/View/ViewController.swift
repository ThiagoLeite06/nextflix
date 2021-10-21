//
//  ViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 12/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
       
        let vc = UIViewController()
        vc.tabBarItem.title = "filmes"
        vc.tabBarItem.image = UIImage(imageLiteralResourceName: "cinama").withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "cinema").withRenderingMode(.alwaysOriginal)
                
        // for text displayed below the tabBar item
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
    }


}


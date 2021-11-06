//
//  TituloSelecionadoViewController.swift
//  NextFlix
//
//  Created by Lilian on 17/10/21.
//

import UIKit
import Kingfisher
import SwiftUI

class TituloSelecionadoViewController: UIViewController {

    @IBOutlet weak var cartazImageView: UIImageView!
    @IBOutlet weak var tituloSelecionadoLabel: UILabel!
    @IBOutlet weak var textoSinopseTextView: UITextView!
    @IBOutlet weak var sinpseLabel: UILabel!
    @IBOutlet weak var elencoLabel: UILabel!
    @IBOutlet weak var elencoCollectionView: UICollectionView!
    
    var content: Content?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
    }
        
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true) {
            print("fechou")
        }
    }
    
    
    private func setupContent() {
        guard let content = content else {
            return
        }

        self.cartazImageView.kf.setImage(with:content.cover, placeholder: UIImage(named: "semImagem"))
        self.tituloSelecionadoLabel.text = content.title
        self.textoSinopseTextView.text = content.overview
    }
}

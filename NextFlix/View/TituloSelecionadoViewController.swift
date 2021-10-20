//
//  TituloSelecionadoViewController.swift
//  NextFlix
//
//  Created by Lilian on 17/10/21.
//

import UIKit

class TituloSelecionadoViewController: UIViewController {

    @IBOutlet weak var cartazImageView: UIImageView!
    @IBOutlet weak var tituloSelecionadoLabel: UILabel!
    @IBOutlet weak var textoSinopseTextView: UITextView!
    @IBOutlet weak var sinpseLabel: UILabel!
    @IBOutlet weak var elencoLabel: UILabel!
   
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    private func setup() {
        tituloSelecionadoLabel.text = movie?.original_title
        textoSinopseTextView.text = movie?.overview
        
    }


}

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
    @IBOutlet weak var elencoCollectionView: UICollectionView!
    
    var movie: Movie?
    var serie: Serie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovie()
//        setupSerie()
    }
    
    
    
    private func setupMovie() {
        
        tituloSelecionadoLabel.text = movie?.title
        textoSinopseTextView.text = movie?.release
        cartazImageView.image = movie?.imageMovie
    }
    
//    private func setupSerie() {
//
//        tituloSelecionadoLabel.text = serie?.titleSerie
//        textoSinopseTextView.text = serie?.description
//        cartazImageView.image = serie?.imageSerie
//    }


}

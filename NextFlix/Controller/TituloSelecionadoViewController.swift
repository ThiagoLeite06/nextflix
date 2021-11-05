//
//  TituloSelecionadoViewController.swift
//  NextFlix
//
//  Created by Lilian on 17/10/21.
//

import UIKit
import Kingfisher

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
        setupSerie()
    }
        
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true) {
            print("fechou")
        }
    }
    
    
    private func setupMovie() {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie?.poster_path)")
        self.cartazImageView.kf.setImage(with:url)
        self.tituloSelecionadoLabel.text = movie?.title
        self.textoSinopseTextView.text = movie?.overview
    }
    
    private func setupSerie() {

        tituloSelecionadoLabel.text = serie?.name
        textoSinopseTextView.text = serie?.overview
//        cartazImageView.image = serie?.poster_path
    }


}

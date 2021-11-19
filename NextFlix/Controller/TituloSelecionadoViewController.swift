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
    
    private let movieService = MovieService()
    private var cast: [Cast] = []
    
    var content: Content?

    let viewModel = SerieViewModel()
    
    @IBOutlet weak var cartazImageView: UIImageView!
    @IBOutlet weak var tituloSelecionadoLabel: UILabel!
    @IBOutlet weak var textoSinopseTextView: UITextView!
    @IBOutlet weak var sinpseLabel: UILabel!
    @IBOutlet weak var elencoLabel: UILabel!
    @IBOutlet weak var elencoCollectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
        loadCast()
        
        viewModel.delegate = self
        viewModel.loadData()
        
//        favButton.setImage(UIImage(named: "heart-fill"), for: .normal)
//        let favorite = content?.convertToFavorite()
    }
    
    
    @IBAction func favButton(_ sender: Any) {
        
        guard let content = content else {
            return
        }

        viewModel.addFavorite(title: content.title, poster_path: content.poster_path, vote_average: content.vote_average)
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true) {
            print("fechou")
        }
    }
    
    private func setupCollectionView() {
        elencoCollectionView.dataSource = self
    }
    
    private func setupContent() {
        guard let content = content else {
            return
        }

        self.cartazImageView.kf.setImage(with:content.cover, placeholder: UIImage(named: "semImagem"))
        self.tituloSelecionadoLabel.text = content.title
        self.textoSinopseTextView.text = content.overview
    }
    
    private func loadCast() {
        movieService.fetchCast(movieId: content!.id) { (resultado) in
            self.cast = resultado
            DispatchQueue.main.async {
                self.elencoCollectionView.reloadData()
            }
        }
    }
}

extension TituloSelecionadoViewController: SerieViewModelDelegate {
    func loadData() {
        //
    }

    func errorAddFavorite() {
        //
    }

    func reloadData() {
        //
    }


}

extension TituloSelecionadoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElencoCollectionViewCell", for: indexPath) as? ElencoCollectionViewCell {
            
            cell.setup(elenco: cast[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}



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
    private let coreDataService = CoreDataService()
    private var cast: [Cast] = []
    
    var content: Content?
    
    let viewModel = SerieViewModel()
    //    let favoriteViewModel = favoriteViewModel()
    
    @IBOutlet weak var cartazImageView: UIImageView!
    @IBOutlet weak var tituloSelecionadoLabel: UILabel!
    @IBOutlet weak var textoSinopseTextView: UITextView!
    @IBOutlet weak var sinpseLabel: UILabel!
    @IBOutlet weak var elencoLabel: UILabel!
    @IBOutlet weak var elencoCollectionView: UICollectionView!
    @IBOutlet weak var buttonFav: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
        loadCast()
        
        elencoCollectionView.dataSource = self
        elencoCollectionView.delegate = self
        
        viewModel.delegate = self
        viewModel.loadData()
        
        let isSerie = content is Serie
        if isSerie {
            print("isso é uma série")
        } else {
            print("isso é um filme")
        }
        
        
        
        
        //        favButton.setImage(UIImage(named: "heart-fill"), for: .normal)
        //        let favorite = content?.convertToFavorite()
    }
    
    func updateFavoriteButton() {
        guard let content = content else {
            return
        }
        let status = viewModel.isFavorite(title: content.title)
        print("Debug ======== \(status)")
        buttonFav.setImage(UIImage(systemName: status == true ? "star.fill" : "star"), for: .normal)
        
    }
    
    
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        
        guard let content = content else {
            return
        }
        
        let isMovie = content is Movie
        let favorite = coreDataService.isFavorite(title: content.title)
        if favorite {
            viewModel.removeFavorite(title: content.title)
            print("============== é favorito")
        } else {
            viewModel.addFavorite(title: content.title, poster_path: content.poster_path, vote_average: content.vote_average, isMovie: isMovie)
        }

        updateFavoriteButton()
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
        updateFavoriteButton()
    }
    
    
}

extension TituloSelecionadoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "elencoCollectionViewCell", for: indexPath) as? ElencoCollectionViewCell {
            
            cell.setup(elenco: cast[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension TituloSelecionadoViewController: UICollectionViewDelegate {
    
}


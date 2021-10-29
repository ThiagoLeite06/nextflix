//
//  MovieTableViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 25/10/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    
    
    var titleSection: String?
    
    var movies: [Movie] = []
    
    public func configure(titleSection: String) {
        self.titleSection = titleSection
        setFilmes()
        self.movieCollectionView.dataSource = self
        self.movieCollectionView.delegate = self
    }
    
    private func setFilmes() {
        switch self.titleSection {
        case "Os mais Populares":
            setFilmesPopulares()
        case "Tendencias":
            setFilmesTendencia()
        default:
            print("Error")
        }
    }
    
    private func setFilmesPopulares() {
        self.movies = [
            .init(imageMovie: #imageLiteral(resourceName: "thelordofthering"), title: "The Lord of the Rings - The Return of the King", release: "25 de dezembro de 2003"),
            .init(imageMovie: #imageLiteral(resourceName: "clubedaluta") , title: "Clube da Luta", release: "29 de outubro de 1999"),
            .init(imageMovie: #imageLiteral(resourceName: "devoltaparafuturo") , title: "De Volta para o Futuro", release: "25 de dezembro de 1985"),
            .init(imageMovie: #imageLiteral(resourceName: "matrix") , title: "Matrix", release: "21 de maio de 1999")
        ]
    }
    
    private func setFilmesTendencia() {
        self.movies = [
            .init(imageMovie: #imageLiteral(resourceName: "thelordofthering"), title: "The Lord of the Rings - The Return of the King", release: "25 de dezembro de 2003"),
            .init(imageMovie: #imageLiteral(resourceName: "clubedaluta") , title: "Clube da Luta", release: "29 de outubro de 1999"),
            .init(imageMovie: #imageLiteral(resourceName: "devoltaparafuturo") , title: "De Volta para o Futuro", release: "25 de dezembro de 1985"),
            .init(imageMovie: #imageLiteral(resourceName: "matrix") , title: "Matrix", release: "21 de maio de 1999")
        ]
    }
}

extension MovieTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as?  MovieCollectionViewCell {
            
            cell.setup(movie: movies[indexPath.row] )
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension MovieTableViewCell: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}


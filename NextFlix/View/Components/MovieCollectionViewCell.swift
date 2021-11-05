//
//  MovieCollectionViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 25/10/21.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    
    func setup(movie: Movie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!
        self.movieImageView.kf.setImage(with:url)
        self.titleLbl.text = movie.title
        self.releaseLbl.text = movie.release_date
    }
    
}

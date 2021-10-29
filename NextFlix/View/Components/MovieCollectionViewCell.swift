//
//  MovieCollectionViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 25/10/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    
    func setup(with movie: Movie) {
        self.movieImageView.image = movie.imageMovie
        self.titleLbl.text = movie.title
        self.releaseLbl.text = movie.release
    }
    
}

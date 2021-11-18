//
//  FavoritesTableViewCell.swift
//  NextFlix
//
//  Created by Thiago Leite on 17/11/21.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    
    func setup(serie: Serie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(serie.poster_path)")!
        self.favoritesImageView.kf.setImage(with:url)
        favoritesImageView.clipsToBounds = true
        favoritesImageView.layer.cornerRadius = 15
        titleLabel.text = serie.name
        
    }

}

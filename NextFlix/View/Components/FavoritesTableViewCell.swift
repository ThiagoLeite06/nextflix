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
    
    
    func setup(favorite: Favorites) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(favorite.poster_path ?? "")")!
        self.favoritesImageView.kf.setImage(with:url)
        favoritesImageView.clipsToBounds = true
        favoritesImageView.layer.cornerRadius = 15
        titleLabel.text = favorite.title
    }
}

//
//  ElencoCollectionViewCell.swift
//  NextFlix
//
//  Created by Lilian on 03/11/21.
//

import UIKit
import Kingfisher

class ElencoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemElenco: UIImageView!
    @IBOutlet weak var nomeElencoLabel: UILabel!
    
    func setup(elenco: Cast) {
        self.nomeElencoLabel.text = elenco.name
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(elenco.profile_path)")!
        self.imagemElenco.kf.setImage(with:url)
    }
}

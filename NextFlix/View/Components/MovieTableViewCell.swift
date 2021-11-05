//
//  MovieTableViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 25/10/21.
//

import UIKit
import CarPlay

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var sessionLbl: UILabel!
    
    
    func setup() {
        sessionLbl.text = "Populares"
        sessionLbl.textColor = UIColor(red: 0.86, green: 0.24, blue: 0.69, alpha: 1.00)
        sessionLbl.font = UIFont(name: "Verdana", size: 16)
    }

    
}


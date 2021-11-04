//
//  ElencoCollectionViewCell.swift
//  NextFlix
//
//  Created by Lilian on 03/11/21.
//

import UIKit

class ElencoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemElenco: UIImageView!
    @IBOutlet weak var nomeElencoLabel: UILabel!
    
    func setup(elenco: Elenco) {
        self.nomeElencoLabel.text = elenco.nome
       // self.imagemElenco.image = elenco.im
    }
}

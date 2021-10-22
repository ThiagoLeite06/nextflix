//
//  SeriesTableViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 22/10/21.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serieImageView: UIImageView!
    @IBOutlet weak var titleSerieLabel: UILabel!
    @IBOutlet weak var bornInLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(serie: Serie) {
        
        serieImageView.image = UIImage (named: serie.imageSerie)
        titleSerieLabel.text = serie.titleSerie
        bornInLabel.text = serie.bornIn
        descriptionLabel.text = serie.description
    }

}

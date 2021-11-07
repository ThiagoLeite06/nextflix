//
//  SeriesTableViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 22/10/21.
//

import UIKit
import Kingfisher

class SeriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serieImageView: UIImageView!
    @IBOutlet weak var titleSerieLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var serieDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(serie: Serie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(serie.poster_path)")!
        self.serieImageView.kf.setImage(with:url)
        serieImageView.clipsToBounds = true
        serieImageView.layer.cornerRadius = 15
        titleSerieLabel.text = serie.name
        releaseLabel.text = serie.first_air_date
    }

}

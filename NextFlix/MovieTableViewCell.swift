//
//  MovieTableViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 25/10/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImagemView: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var bornInLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(movie: Movie) {
        movieImagemView.image = UIImage (named: movie.imageMovie)
        titleMovieLabel.text = movie.titleMovie
        bornInLabel.text = movie.bornIn
    }

}

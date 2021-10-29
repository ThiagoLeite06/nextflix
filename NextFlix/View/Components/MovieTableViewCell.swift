//
//  MovieTableViewCell.swift
//  NextFlix
//
//  Created by Gui Feitosa on 25/10/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    
    var movies: [Movie] = [] {
        didSet{
            movieCollectionView.delegate = self
            movieCollectionView.dataSource = self
            movieCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension MovieTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        return cell
    }
    
    
}

extension MovieTableViewCell: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}


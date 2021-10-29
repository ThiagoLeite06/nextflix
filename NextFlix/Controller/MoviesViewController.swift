//
//  MoviesViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 12/10/21.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = [
        .init(imageMovie: #imageLiteral(resourceName: "thelordofthering"), title: "The Lord of the Rings - The Return of the King", release: "25 de dezembro de 2003"),
        .init(imageMovie: #imageLiteral(resourceName: "clubedaluta") , title: "Clube da Luta", release: "29 de outubro de 1999"),
        .init(imageMovie: #imageLiteral(resourceName: "devoltaparafuturo") , title: "De Volta para o Futuro", release: "25 de dezembro de 1985"),
        .init(imageMovie: #imageLiteral(resourceName: "matrix") , title: "Matrix", release: "21 de maio de 1999")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}
extension MoviesViewController: UITableViewDelegate {
    
}
extension MoviesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2

    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? MovieTableViewCell {
            cell.sessionLbl.text = "Mais procurados"
            
            cell.movieCollectionView.delegate = self
            cell.movieCollectionView.dataSource = self
     
            return cell

        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350.0
    }
}

extension MoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MovieCollectionViewCell
        collection.setup(movie: movies[indexPath.row])
        return collection
    }
    
    
}

extension MoviesViewController: UICollectionViewDelegate {
    
}



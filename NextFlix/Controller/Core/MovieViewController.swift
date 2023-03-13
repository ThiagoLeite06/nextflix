//
//  MoviesViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 12/10/21.
//

import UIKit

class MovieViewController: UIViewController {
    
    let movieListView = MovieListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filmes"
        view.backgroundColor = .systemRed
        view.addSubview(movieListView)
        NSLayoutConstraint.activate([
            movieListView.topAnchor.constraint(equalTo: view.topAnchor),
            movieListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            movieListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieListView.rightAnchor.constraint(equalTo: view.rightAnchor  )
        ])
        
    }
}


// MARK: - TableViewDataSource

//extension MovieViewController: UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numberOfRowsInSection
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? MovieTableViewCell {
//            cell.movieCollectionView.delegate = self
//            cell.movieCollectionView.dataSource = self
//            cell.movieCollectionView.reloadData()
//            cell.contentView.backgroundColor = UIColor.black
//            return cell
//
//        }
//
//        return UITableViewCell()
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 350.0
//    }
//}

// MARK: - CollectionView

//extension MovieViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.movies.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MovieCollectionViewCell
//        collection.setup(movie: viewModel.movies[indexPath.row])
//
//        return collection
//    }
//    
//    
//}
//
//extension MovieViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movie = viewModel.movies[indexPath.row]
//        performSegue(withIdentifier: "SegueFilmeDetailIdentifier", sender: movie)
//    }
//}



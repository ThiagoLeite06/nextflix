//
//  MovieListViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 10/03/23.
//

import UIKit

final class MovieListViewModel: NSObject {
    func fetchMovies() {
        NFService.shared.execute(.listMoviesRequests, expecting: MovieResponse.self) { result in
            switch result {
            case .success(let model):
                print(model.results.count)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension MovieListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
       let width = (bounds.width-30)/2
       return CGSize(width: width, height: width * 1.5)
    }
    
}

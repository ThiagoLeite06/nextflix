//
//  MoviesViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 12/10/21.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
   
    var movies: [Movie] = [
        
        .init(imageMovie: #imageLiteral(resourceName: "thelordofthering"), title: "The Lord of the Rings - The Return of the King", release: "25 de dezembro de 2003"),
        .init(imageMovie: #imageLiteral(resourceName: "clubedaluta") , title: "Clube da Luta", release: "29 de outubro de 1999"),
        .init(imageMovie: #imageLiteral(resourceName: "devoltaparafuturo") , title: "De Volta para o Futuro", release: "25 de dezembro de 1985"),
        .init(imageMovie: #imageLiteral(resourceName: "matrix") , title: "Matrix", release: "21 de maio de 1999")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    
}

extension MoviesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell {
            
            cell.movies = movies
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

extension MoviesViewController: UITableViewDelegate{}

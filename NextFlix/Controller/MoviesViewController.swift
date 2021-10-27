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
        .init(imageMovie: "thelordofthering", titleMovie: "The Lord of the Rings - The Return of the King", bornIn: "25 de dezembro de 2003"),
        .init(imageMovie: "clubedaluta", titleMovie: "Clube da Luta", bornIn: "29 de outubro de 1999"),
        .init(imageMovie: "devoltaparafuturo", titleMovie: "De Volta para o Futuro", bornIn: "25 de dezembro de 1985"),
        .init(imageMovie: "matrix", titleMovie: "Matrix", bornIn: "21 de maio de 1999")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
}

extension MoviesViewController: UITableViewDataSource{
    
    private func configTableView() {
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        moviesTableView.tableFooterView = .init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath) as? MovieTableViewCell {
            
            cell.setup(movie: movies[indexPath.section])
            return cell
        }
        
        return UITableViewCell()
    }
}

extension MoviesViewController: UITableViewDelegate{}

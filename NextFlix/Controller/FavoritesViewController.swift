//
//  FavoritesViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 17/11/21.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let viewModel = FavoriteViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filmAndSerieSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filterSegmentedControl()
    }
    
    private func filterSegmentedControl() {
        
        guard let favoriteType = FavoriteViewModel.FavoriteType(rawValue: filmAndSerieSegmentedControl.selectedSegmentIndex) else { return }
        
        switch favoriteType {
        case .film:
            viewModel.loadData(with: 0)
        case .serie:
            viewModel.loadData(with: 1)
        }
        
        reloadData()
    }
    
    @IBAction func mySegmentedControl(_ sender: UISegmentedControl) {
        
        filterSegmentedControl()
    }
}

extension FavoritesViewController: FavoriteViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
    
    func errorAddFavorite() {
        print("Erro Adicionar")
    }    
}

extension FavoritesViewController: UITableViewDelegate {
    
      
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celula selecionada")
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            let favorite = viewModel.favorites[indexPath.row]
            viewModel.removeFavorite(favorite: favorite)

            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {

        }
    }
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getFavoriteCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell {
            
            let favorite = viewModel.favorites[indexPath.row]
        
            cell.setup(favorite: favorite)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}




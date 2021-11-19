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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        viewModel.delegate = self
        viewModel.loadData()
        tableView.dataSource = self
        tableView.delegate = self
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
    
    // Configuração Número Seção
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return viewModel.titleSection.count
//    }
//
        // Configuração font e fundo Seção
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if let headView = view as? UITableViewHeaderFooterView {
//            headView.contentView.backgroundColor = UIColor(red: 0.06, green: 0.06, blue: 0.06, alpha: 1.00)
//            headView.textLabel?.textColor = UIColor(red: 0.86, green: 0.24, blue: 0.69, alpha: 1.00)
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getFavoriteCount()
    }
    
    // Separação Seção
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return viewModel.titleSection[section]
//    }
    
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




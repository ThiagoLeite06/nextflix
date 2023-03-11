//
//  TabBarController.swift
//  NextFlix
//
//  Created by Thiago Leite on 10/03/23.
//

import UIKit

/// Controller to house tabs and root tab controllers
final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let movieVC = MovieViewController()
        let seriesVC = SerieViewController()
        let favoritesVC = FavoritesViewController()
        let profileVC = ProfileViewController()
        
        movieVC.title = "Fimes"
        seriesVC.title = "Séries"
        favoritesVC.title = "Favoritos"
        profileVC.title = "Perfíl"
        
        let nav1 = UINavigationController(rootViewController: movieVC)
        let nav2 = UINavigationController(rootViewController: seriesVC)
        let nav3 = UINavigationController(rootViewController: favoritesVC)
        let nav4 = UINavigationController(rootViewController: profileVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Filmes", image: UIImage(systemName: "popcorn"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Séries", image: UIImage(systemName: "play.display"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Perfíl", image: UIImage(systemName: "person"), tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}


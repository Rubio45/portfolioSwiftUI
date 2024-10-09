//
//  GFTabBarController.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 8/10/24.
//

import UIKit

class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor     = .systemGreen
        self.viewControllers                = [createSearchNavigationController(), createFavoritesNavigationController()]
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC            = SearchVCViewController()
        searchVC.title          = "Search"
        searchVC.tabBarItem     = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesVC         = FavoritesListViewController()
        favoritesVC.title       = "Favorites"
        favoritesVC.tabBarItem  = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 1)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}

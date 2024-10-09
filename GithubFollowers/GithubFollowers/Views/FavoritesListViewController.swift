//
//  FavoritesListViewController.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 22/9/24.
//

import UIKit

class FavoritesListViewController: UIViewController {

    let tableView               = UITableView()
    var favorites: [Follower]   = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    private func configureViewController() {
        title                   = "Favorites"
        view.backgroundColor    = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            
            guard let self else { return }
            
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    showEmptyStateView(with: "No Favorites?\nAdd one on the follower screen", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let failure):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: failure.rawValue, buttonTitle: "OK")
                break
            }
        }
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame         = view.bounds
        tableView.rowHeight     = 80
        
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(GFFavoriteCell.self, forCellReuseIdentifier: GFFavoriteCell.reuseID)
    }
}

extension FavoritesListViewController: UITableViewDelegate, UITableViewDataSource {
    // seeting the rows of table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    // setting the data set
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GFFavoriteCell.reuseID) as! GFFavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    // push controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destVC   = FollowersListViewController()
        destVC.username = favorite.login
        destVC.title = favorite.login
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    // checking if they are deliting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
            guard let self else { return }
            
            // si no hay un error, todo ok
            guard let error else { return }
            self.presentGFAlertOnMainThread(title: "Unable to Remove", message: error.rawValue, buttonTitle: "OK")
        }
    }
}

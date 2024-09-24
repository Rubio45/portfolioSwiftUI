//
//  FollowersListViewController.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 22/9/24.
//

import UIKit

class FollowersListViewController: UIViewController {

    var username: String!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureCollectionView()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollower(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                self.presentGFAlertOnMainThread(title: "SUCCESS", message: "Followers fetched successfully", buttonTitle: "OK")
                print("Followers.count = \(followers.count)")
                print(followers)
            case .failure(let errorMessage):
                self.presentGFAlertOnMainThread(title: "BAD STUFF", message: errorMessage.rawValue, buttonTitle: "OK")
            }
        }
    }
}

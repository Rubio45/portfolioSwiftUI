//
//  FollowersListViewController.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 22/9/24.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    enum Section { case main }
    
    var isSearching = false
    var hasMoreFollowers = true
    var username: String!
    var collectionView: UICollectionView!
    var filteredFollowers: [Follower] = []
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>! // <Section, Model>
    var followers: [Follower] = []
    var page: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureCollectionView()
        getFollowers(username: username, page: page)
        configureDataSource()
        configureSearchController()
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    // MARK: Search Controller
    private func configureSearchController() {
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.placeholder                  = "Search for a user"
        navigationItem.searchController                         = searchController
        // setting search Bar to navigation
        //navigationItem.hidesSearchBarWhenScrolling              = true
        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.searchBar.delegate                     = self
    }
    
    func getFollowers(username: String, page: Int) {
        showLoadingView()
        NetworkManager.shared.getFollower(for: username, page: page) { [weak self] result in
            // #warning("Call Dismiss") // warning instead of TO DO
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false}
                self.followers.append(contentsOf: followers) // adding an array to an array
                
                if self.followers.isEmpty {
                    let message = "This user doesn't have any followers. Go Follow Them!"
                    DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
                    return
                }
                self.updateData(on: self.followers)
            case .failure(let errorMessage):
                self.presentGFAlertOnMainThread(title: "BAD STUFF", message: errorMessage.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView) { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        }
    }
    
    private func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main]) // create Snapshot, append section, append Items.
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}

extension FollowersListViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray             = isSearching ? filteredFollowers : followers
        let follower                = activeArray[indexPath.item]
        let destVC                  = UserInfoViewController()
        destVC.username             = follower.login
        let navController           = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}

extension FollowersListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter                        = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching                             = true
        self.filteredFollowers                  = followers.filter { $0.login.lowercased().contains(filter.lowercased()) }
        updateData(on: self.filteredFollowers)
    }
    // setting search cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: followers)
    }
}

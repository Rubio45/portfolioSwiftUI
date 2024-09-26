//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 25/9/24.
//

import UIKit

class UserInfoViewController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self else { return }
            
            switch result {
                case .success(let user):
                    print(user)
                case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
}

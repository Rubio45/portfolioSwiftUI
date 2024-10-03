//
//  FavoriteListVC.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit

class FavoriteListVC: UIViewController {

    let contactListVC = ContactListVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactListVC.contactList = contactListVC.contactList.filter({ $0.isFavorite })
        view.backgroundColor      = .systemBackground
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

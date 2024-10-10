//
//  UITableViewExtension.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 9/10/24.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}

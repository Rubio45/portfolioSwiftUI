//
//  UIView.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 8/10/24.
//

import UIKit

extension UIView {
    // añadir facilmente los UIView como subviews. 
    func addSubviews(_ views: UIView...) {
        for view in views { addSubviews(view) }
    }
}

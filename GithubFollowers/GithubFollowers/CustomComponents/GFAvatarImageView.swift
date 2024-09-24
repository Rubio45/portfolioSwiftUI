//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 23/9/24.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")!

   override init(frame: CGRect) {
       super.init(frame: frame)
       setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.cornerRadius                          = 10
        clipsToBounds                               = true
        image                                       = placeholderImage
        translatesAutoresizingMaskIntoConstraints   = false
    }
}

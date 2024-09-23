//
//  GFButton.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 22/9/24.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero) // contrainst will give it shape
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius                        = 10
        titleLabel?.textColor                     = .white
        titleLabel?.font                          = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}

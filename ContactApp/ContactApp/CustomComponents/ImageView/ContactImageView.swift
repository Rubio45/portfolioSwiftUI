//
//  ContactImageView.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit

class ContactImageView: UIImageView {

    let placeholder = UIImage(named: "placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.cornerRadius                           = bounds.height / 2
        contentMode                                  = .scaleAspectFill
        clipsToBounds                                = true
        translatesAutoresizingMaskIntoConstraints    = false
        image                                        = placeholder
    }
}

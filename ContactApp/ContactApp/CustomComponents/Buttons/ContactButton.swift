//
//  ContactButton.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit

class ContactButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        setTitle(title, for: .normal)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints   = false
        backgroundColor                              = .tertiarySystemBackground
        titleLabel?.font                             = UIFont.systemFont(ofSize: 14, weight: .bold)
        tintColor                                    = .label
        layer.cornerRadius                           = 10
    }
}

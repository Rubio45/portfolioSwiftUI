//
//  BasicTextField.swift
//  UITestDEMOAPP
//
//  Created by Alex Diaz on 26/10/24.
//

import UIKit

class BasicTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    init(placeholder: String, secureTextFieldEntry: Bool) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.layer.borderWidth  = 1
        self.layer.borderColor  = UIColor.placeholderText.cgColor
        self.textColor          = .placeholderText
        
    }
}

//
//  ContactTextField.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit

class ContactTextField: UITextField {
    
    private let padding: UIEdgeInsets
        
    init(frame: CGRect, keyboardType: UIKeyboardType, placeholder: String, padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)) {
        self.padding = padding
        super.init(frame: frame)
        
        self.keyboardType   = keyboardType
        self.placeholder    = placeholder
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor                                 = .label
        tintColor                                 = .label
        textAlignment                             = .left
        font                                      = UIFont.systemFont(ofSize: 16, weight: .medium)
        minimumFontSize                           = 12
        adjustsFontSizeToFitWidth                 = true
        layer.borderColor                         = UIColor.systemGray5.cgColor
        layer.borderWidth                         = 2
        layer.cornerRadius                        = 5
        autocorrectionType                        = .no
        backgroundColor                           = .tertiarySystemBackground
        returnKeyType                             = .next
    }
    
}

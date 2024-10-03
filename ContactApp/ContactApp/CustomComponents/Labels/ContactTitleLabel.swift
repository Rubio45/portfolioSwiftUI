//
//  ContactTitleLabel.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit

class ContactTitleLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.textAlignment              = textAlignment
        self.font                       = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        minimumScaleFactor          = 0.9
        adjustsFontSizeToFitWidth   = true
        textColor                   = .label
        lineBreakMode               = .byTruncatingTail
    }
}

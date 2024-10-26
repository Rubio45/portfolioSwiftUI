//
//  BasicLabel.swift
//  UITestDEMOAPP
//
//  Created by Alex Diaz on 26/10/24.
//

import UIKit

class BasicLabel: UILabel {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        font = .preferredFont(forTextStyle: .subheadline)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
    }
}

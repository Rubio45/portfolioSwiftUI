//
//  BasicTableViewCell.swift
//  UITestDEMOAPP
//
//  Created by Alex Diaz on 26/10/24.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    
    static let identifier: String = "BasicTableViewCell"
    let titleLabel = BasicLabel()
    let uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            configure()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(uiImageView)
        
        NSLayoutConstraint.activate([
            uiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            uiImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            uiImageView.heightAnchor.constraint(equalToConstant: 40),
            uiImageView.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(equalTo: uiImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: uiImageView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
        ])
    }
    
    func setCell(with title: String, image: UIImage?) {
        titleLabel.text = title
        uiImageView.image = image
    }
}

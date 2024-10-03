//
//  ContactCell.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit

class ContactCell: UITableViewCell {
    
    static let reuseIdentifier: String = "ContactCell"

    let contactImage                    = ContactImageView(frame: .zero)
    let contactName                     = ContactTitleLabel(textAlignment: .left, fontSize: 14)
    let contactCompany                  = ContactSecondaryTitleLabel(fontSize: 10)
    private let padding: CGFloat        = 5
    private let textPadding: CGFloat    = 10
    let divider                         = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? = ContactCell.reuseIdentifier) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContact(contactModel: ContactModel) {
        contactImage.image      = UIImage(systemName: "person.circle")
        contactImage.tintColor  = .label
        contactName.text        = "\(contactModel.name ?? "")  \(contactModel.lastName ?? "")"
        contactCompany.text     = contactModel.company ?? ""
     }
    
    private func configureCell(contactCompanyExists: Bool = true) {
        addSubview(contactName)
        addSubview(contactCompany)
        addSubview(contactImage)
        addSubview(divider)
        divider.backgroundColor = .systemGray4
        
        NSLayoutConstraint.activate([
            // I am adding all the constraint at the same time because it is only 1 cell with 3 elements
            contactImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contactImage.heightAnchor.constraint(equalToConstant: 30),
            contactImage.widthAnchor.constraint(equalToConstant: 30),
            
            contactName.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: textPadding),
            contactName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: contactCompanyExists ? -5 : 0),
            contactName.heightAnchor.constraint(equalToConstant: 18),
            contactName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            contactCompany.leadingAnchor.constraint(equalTo: contactName.leadingAnchor),
            contactCompany.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            contactCompany.topAnchor.constraint(equalTo: contactName.bottomAnchor, constant: 5),
            contactCompany.heightAnchor.constraint(equalToConstant: 12),
            
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

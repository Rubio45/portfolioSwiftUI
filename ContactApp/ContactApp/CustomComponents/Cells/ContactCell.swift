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
    // MARK: Set Contact
    func setContact(contactModel: ContactModel) {
        setImage(image: contactModel.image)
        contactImage.tintColor  = .label
        contactName.text        = "\(contactModel.name ?? "")  \(contactModel.lastName ?? "")"
        contactCompany.text     = contactModel.company ?? ""
        // it doesn't work
        /* var contactCompanyExists: Bool = true
        if let companyName = contactModel.company, companyName.isEmpty {
            contactCompanyExists = false
        }
        configureCell(contactCompanyExists: contactCompanyExists) */
     }
    // MARK: Set Image
    func setImage(image: Data?) {
        if let imageData = image {
            contactImage.image  = UIImage(data: imageData)
        } else {
            contactImage.image  = UIImage(systemName: "person.circle")
        }
        contactImage.contentMode        = .scaleAspectFill
        contactImage.clipsToBounds      = true
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            contactImage.layer.cornerRadius = contactImage.bounds.height / 2
        }
    // MARK: CELL
    private func configureCell(contactCompanyExists: Bool = true) {
        addSubview(contactName)
        addSubview(contactCompany)
        addSubview(contactImage)
        addSubview(divider)
        divider.backgroundColor = .systemGray4
        // MARK: Contraints
        NSLayoutConstraint.activate([ // I am adding all the constraint at the same time because it is only 1 cell with 3 elements
            contactImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contactImage.heightAnchor.constraint(equalToConstant: 45),
            contactImage.widthAnchor.constraint(equalToConstant: 45),
            
            contactName.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: textPadding),
            contactName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: contactCompanyExists ? -5 : 0),
            contactName.heightAnchor.constraint(equalToConstant: 18),
            contactName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textPadding),
            
            contactCompany.leadingAnchor.constraint(equalTo: contactName.leadingAnchor),
            contactCompany.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textPadding),
            contactCompany.topAnchor.constraint(equalTo: contactName.bottomAnchor, constant: 5),
            contactCompany.heightAnchor.constraint(equalToConstant: 12),
            
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

//
//  ProductDetailViewController.swift
//  APIAppUAMExample
//
//  Created by Alex Diaz on 10/10/24.
//

import UIKit

class ProductDetailViewController: UIViewController {

    let controller: MainController
    let product: ProductModel?
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let brandLabel = UILabel()
    let discountLabel = UILabel()
    let descriptionLabel = UILabel()
    var priceButton: UIButton = UIButton()
    let categoryLabel = UILabel()
    private let padding: CGFloat = 10
    
    init(product: ProductModel?, controller: MainController) {
        self.product = product
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProductDetail()
        setupLayout()
    }
    
    func setProductDetail() {
        guard let product = self.product else { return }
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        categoryLabel.text = product.category.capitalized
        brandLabel.text = product.brand?.capitalized ?? ""
        discountLabel.text = "\(product.discountPercentage)% off"
        
        var configuration: UIButton.Configuration = .borderedTinted()
        configuration.cornerStyle = .medium
        configuration.title = String(format: "$%.2f", product.price)

        configuration.image = UIImage(systemName: "cart")
        configuration.imagePlacement = .leading
        configuration.imagePadding = 5
        priceButton = UIButton(configuration: configuration)
        
        
        Task {
            imageView.image = await controller.loadImage(url: product.thumbnail)
        }
    }
    
    func setupLayout() {
        
        [imageView, titleLabel, descriptionLabel, priceButton, categoryLabel, discountLabel, brandLabel].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        setupImageConstraints()
        setupLabels()
        setupButton()
    }
    
    func setupImageConstraints() {
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupLabels() {
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        descriptionLabel.numberOfLines = 4
        descriptionLabel.lineBreakMode = .byTruncatingTail
        categoryLabel.font = UIFont.systemFont(ofSize: 14)
        categoryLabel.textAlignment = .right
        categoryLabel.textColor = .secondaryLabel
        brandLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        brandLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding / 2),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.widthAnchor.constraint(equalToConstant: 350),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            brandLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            brandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            brandLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            brandLabel.heightAnchor.constraint(equalToConstant: 22),
            
            descriptionLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100),
            
            categoryLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            categoryLabel.heightAnchor.constraint(equalToConstant: 24),
            categoryLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func setupButton() {
        discountLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        discountLabel.textAlignment = .right
        NSLayoutConstraint.activate([
            priceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            priceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            priceButton.heightAnchor.constraint(equalToConstant: 45),
            priceButton.widthAnchor.constraint(equalToConstant: 150),
            
            discountLabel.bottomAnchor.constraint(equalTo: priceButton.topAnchor, constant: -padding),
            discountLabel.trailingAnchor.constraint(equalTo: priceButton.trailingAnchor),
            discountLabel.heightAnchor.constraint(equalToConstant: 18),
            discountLabel.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}

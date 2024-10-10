//
//  AddProductViewController.swift
//  APIAppUAMExample
//
//  Created by Macbook on 4/10/24.
//

import UIKit

class AddProductViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var stockTextField: UITextField!
    
    private let addProductController = AddProductController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Product"
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        guard let title = titleTextField.text,
              let description = descriptionTextField.text,
              let price = priceTextField.text,
              let stock = stockTextField.text
        else { return }
        
        let product = ProductModel(
            id: nil,
            title: title,
            description: description,
            category: "",
            price: Double(price) ?? 0,
            discountPercentage: .zero,
            stock: Double(stock) ?? 0,
            brand: "",
            thumbnail: ""
        )
        
        Task {
            let result = await addProductController.createProduct(product)
            
            if result {
                navigationController?.popViewController(animated: true)
            } else {
                let alert = UIAlertController(title: "Creation product failure", message: "There was an error on the product.", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(action)
                
                present(alert, animated: true)
            }
        }
    }
}

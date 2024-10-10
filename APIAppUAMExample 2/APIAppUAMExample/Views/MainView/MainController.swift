//
//  MainController.swift
//  APIAppUAMExample
//
//  Created by Macbook on 8/10/24.
//

import UIKit

final class MainController {
    private let apiDataSource = APIDataSource()
    
    func getProducts(query: String = "") async -> [ProductModel]? {
        await apiDataSource.getProducts(query: query)
    }
    
    func loadImage(url: String) async -> UIImage? {
        await apiDataSource.loadImage(urlString: url)
    }
    
    func deleteToken() {
        apiDataSource.deleteToken()
    }
    
    func getProduct(id: Int) async -> ProductModel? {
        await apiDataSource.getProduct(id: id)
    }
}

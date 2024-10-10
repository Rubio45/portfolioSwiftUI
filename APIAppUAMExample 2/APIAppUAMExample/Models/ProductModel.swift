//
//  ProductModel.swift
//  APIAppUAMExample
//
//  Created by Macbook on 3/10/24.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [ProductModel]
}

struct ProductModel: Hashable, Codable {
    let id: Int?
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let stock: Double
    let brand: String?
    let thumbnail: String
}

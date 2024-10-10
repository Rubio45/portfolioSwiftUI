//
//  APIDataSource.swift
//  APIAppUAMExample
//
//  Created by Macbook on 4/10/24.
//

import UIKit

final class APIDataSource {
    private let host = "https://dummyjson.com"
    let cache = NSCache<NSString, UIImage>()
    
    func logIn(username: String, password: String) async -> LoginResponse? {
        guard let url = URL(string: "\(host)/auth/login") else { return nil }
        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let loginData = [
                "username": username,
                "password": password,
            ]
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: loginData, options: [])
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return nil }
            
            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            
            saveToken(loginResponse.accessToken)
            setDate()
            
            return loginResponse
            
        } catch {
            return nil
        }
    }
    
    func getProducts(query: String) async -> [ProductModel]? {
        var urlComponents = URLComponents(string: "\(host)/auth/products/search")
        // URL nueva y personalizada.
        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        // crear la url.
        guard let url = urlComponents?.url, let token = getToken() else { return nil }
        
        // añadir las cabeceras
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "GET"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlrequest)
            
            guard
                let urlResponse = response as? HTTPURLResponse,
                urlResponse.statusCode == 200
            else { return nil }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            let productResponse = try decoder.decode(ProductResponse.self, from: data)
            
            return productResponse.products
            // debugueo. No encontraba el error al añadir brand. Puede ser nil.
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted: \(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found: \(context.debugDescription)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch: \(context.debugDescription)")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found: \(context.debugDescription)")
        } catch {
            print("Error decoding: \(error)")
        }
        return nil
    }
    
    func getProduct(id: Int) async -> ProductModel? {
        let urlString = "\(host)/auth/products/\(id)"
        
        guard let url = URL(string: urlString) else { return nil}
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else { return nil }
            let decoder = JSONDecoder()
            let product = try decoder.decode(ProductModel.self, from: data)
            print(product)
            return product
        } catch {
            return nil
        }
    }
    
    func loadImage(urlString: String) async -> UIImage? {
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: urlString) else { return nil }
            
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard
                let urlResponse = response as? HTTPURLResponse,
                urlResponse.statusCode == 200
            else { return nil }
            
            guard let image = UIImage(data: data) else { return nil}
            self.cache.setObject(image, forKey: cacheKey)
            
            return image
        } catch {
            return nil
        }
    }
    
    func createProduct(_ product: ProductModel) async -> Bool {
        guard let url = URL(string: "\(host)/auth/products/add"),
              let token = getToken()
        else { return false}
        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            urlRequest.httpBody = try JSONEncoder().encode(product)
            
            let (_, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let urlResponse = response as? HTTPURLResponse,
                  urlResponse.statusCode == 201
            else { return false }
            
            return true
        } catch {
            return false
        }
    }
    
    private func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    func getToken() -> String? {
        UserDefaults.standard.string(forKey: "token")
    }
    
    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
    func setDate() {
        UserDefaults.standard.set(Date(), forKey: "date")
    }
}

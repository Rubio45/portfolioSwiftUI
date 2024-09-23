//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 22/9/24.
//

import Foundation

class NetworkManager {
    // creating a singleton
    static let shared       = NetworkManager()
    let baseURL: String     = "https://api.github.com/users/"
    private init() {}
    
    func getFollower(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        let endpoint = baseURL + username + "/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, .unableToComplete)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil, .invalidData)
                return
            }
            
            // Parsing the JSON.
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers =  try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, .invalidData)
            }
        }
        task.resume()
    }
}
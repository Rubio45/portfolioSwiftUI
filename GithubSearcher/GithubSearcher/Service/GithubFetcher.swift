//
//  GithubFetcher.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//

import SwiftUI

class GithubFetcher {

    let username: String
    private var endpoint: String = "https://api.github.com/users/"

    init(username: String) {
        self.username = username
        endpoint += username
    }

    func getUser() async throws -> GitHubUser {
        guard let url = URL(string: self.endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(GitHubUser.self, from: data)
    }

    func getFollowers(user: GitHubUser) async throws -> [GitHubFollower] {
        guard let url = URL(string: endpoint + "/followers") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode([GitHubFollower].self, from: data)
    }
}

//
//  GitHubFollower.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//
import Foundation

struct GitHubFollower: Codable, Identifiable {
    let login: String
    let avatarUrl: String
    let followersUrl: String
    let id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case followersUrl = "followers_url"
    }
}

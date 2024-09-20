//
//  DataModel.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//

import Foundation

struct GitHubUser: Codable, Identifiable {
    let id = UUID()
    let login: String
    let avatarUrl: String
    let bio: String?
    let followers: Int
    let following: Int
    let publicRepos: Int
    let location: String?
    let email: String?
    let twitterUsername: String?
    let createdAt: String
    let followersUrl: String
    let updatedAt: String
    let name: String?
    let company: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case bio
        case followers
        case following
        case publicRepos = "public_repos"
        case location
        case email
        case name
        case twitterUsername = "twitter_username"
        case createdAt = "created_at"
        case followersUrl = "followers_url"
        case updatedAt = "updated_at"
        case company
    }
}

/*
 "login": "Rubio45",
   "id": 141590445,
   "node_id": "U_kgDOCHB_rQ",
   "avatar_url": "https://avatars.githubusercontent.com/u/141590445?v=4",
   "gravatar_id": "",
   "url": "https://api.github.com/users/Rubio45",
   "html_url": "https://github.com/Rubio45",
   "followers_url": "https://api.github.com/users/Rubio45/followers",
   "following_url": "https://api.github.com/users/Rubio45/following{/other_user}",
   "gists_url": "https://api.github.com/users/Rubio45/gists{/gist_id}",
   "starred_url": "https://api.github.com/users/Rubio45/starred{/owner}{/repo}",
   "subscriptions_url": "https://api.github.com/users/Rubio45/subscriptions",
   "organizations_url": "https://api.github.com/users/Rubio45/orgs",
   "repos_url": "https://api.github.com/users/Rubio45/repos",
   "events_url": "https://api.github.com/users/Rubio45/events{/privacy}",
   "received_events_url": "https://api.github.com/users/Rubio45/received_events",
   "type": "User",
   "site_admin": false,
   "name": "Alex Yanez",
   "company": null,
   "blog": "",
   "location": "Managua, Nicaragua",
   "email": null,
   "hireable": null,
   "bio": "Europe Business Development Manager at BitMart, CryptoTrader, looking to know more about Code. Learning iOS and VisionOS using Swift and Swift UI.",
   "twitter_username": null,
   "public_repos": 5,
   "public_gists": 0,
   "followers": 1,
   "following": 3,
   "created_at": "2023-08-06T22:10:03Z",
   "updated_at": "2024-09-17T19:22:13Z"
 */

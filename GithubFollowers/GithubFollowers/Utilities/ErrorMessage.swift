//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by Alex Diaz on 23/9/24.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "No data returned from the server. Please try again."
}

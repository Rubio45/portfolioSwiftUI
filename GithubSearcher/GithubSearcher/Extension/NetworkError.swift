//
//  NetworkError.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//
import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

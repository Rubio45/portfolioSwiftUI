//
//  Section.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import Foundation

enum LetterSection: String, CaseIterable {
    case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
    
    init?(firstLetter: String) {
        guard let firstChar = firstLetter.first?.uppercased(), let section = LetterSection(rawValue: firstChar) else {
            return nil
        }
        self = section
    }
}

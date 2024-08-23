//
//  UIAplication.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

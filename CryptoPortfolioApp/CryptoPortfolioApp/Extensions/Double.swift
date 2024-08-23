//
//  Double.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import Foundation

extension Double {
    
    /// Convertir un double en una moneda
    /// ```
    ///Convertir 2143.1203 a $2,143.12
    ///Convertir 2149023.1203 a $2,149,023.12
    ///Convertir 0.1203 a $0.12
    /// ```
    private var currentFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        
        //formatter.locale = .current
        //formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currentFormatter6.string(from: number) ?? ""
    }
    
    func formattedInBnOrTrn() -> String {
            let trillion = 1_000_000_000_000.0
            let billion = 1_000_000_000.0

            if self >= trillion {
                let formattedNumber = self / trillion
                return String(format: "$%.2f Trn", formattedNumber)
            } else if self >= billion {
                let formattedNumber = self / billion
                return String(format: "$%.2f Bn", formattedNumber)
            } else {
                return String(format: "%.2f", self)
            }
        }
    
}

//
//  Color.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 21/8/24.
//

import Foundation
import SwiftUI

// accedo primero a theme para luego elegir los colores seleccionados por mi y luego no tener un lio
extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let red = Color("RedColor")
    let green = Color("GreenColor")
    let secondaryText = Color("SecondaryTextColor")
}

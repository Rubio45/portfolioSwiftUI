//
//  Color.swift
//  Selector de Colores
//
//  Created by Alex Diaz on 16/7/24.
//

import Foundation
import SwiftUI

enum Colour: CaseIterable {
    case red, green, blue ,yellow ,orange ,purple ,brown ,pink ,gray ,white ,black ,cyan
    
    // Poner nombre a cada uno de los colores
    var name: String {
        switch self {
        case .red:
            return "Rojo"
        case .green:
            return "Verde"
        case .blue:
            return "Azul"
        case .yellow:
            return "Amarillo"
        case .orange:
            return "Naranja"
        case .purple:
            return "Morado"
        case .brown:
            return "Marrón"
        case .pink:
            return "Rosa"
        case .gray:
            return "Gris"
        case .white:
            return "Blanco"
        case .black:
            return "Negro"
        case .cyan:
            return "Cian"
        }
    }
    // hacer una variable color para darle color al rectangulo
    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .brown:
            return .brown
        case .pink:
            return .pink
        case .gray:
            return .gray
        case .white:
            return .white
        case .black:
            return .black
        case .cyan:
            return .cyan
        }
    }
}

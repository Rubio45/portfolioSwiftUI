//
//  DragState.swift
//  guiaApp
//
//  Created by Alex Diaz on 12/8/24.
//

import Foundation

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero // return 0 para que no haya nada de translation
        case .dragging(let translation):
            return translation // calcular la translation
        }
    }
    // ver si estamos arrastrando
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    // saber si estamos presionando la pantalla
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

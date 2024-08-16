//
//  ContentView.swift
//  Selector de Colores
//
//  Created by Alex Diaz on 16/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedColor: Colour = .red
    
    var body: some View {
            VStack(spacing: 40) {
        RoundedRectangleView(color: $selectedColor)
                    .animation(.spring(), value: selectedColor)
        // iterar en cada una de filas de la matriz
        ForEach(colorMatriz, id: \.self) { row in
            HStack(spacing: 40) {
                // contruir cada una de las filas con un HStack
                ForEach(row, id: \.self) { color in
                    //construir la circle view
                    ColorCircleView(selectedColor: $selectedColor, color: color)
                }
            }
        }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.black)
}

private var colorMatriz: [[Colour]] {
        [
            [.red, .green, .blue],
            [.yellow, .orange, .purple],
            [.brown, .pink, .gray],
            [.white, .black, .cyan]
        ]
    }
}

struct ColorCircleView: View {
    // poner la variable binding para poner actualizar el estado de la main View
    @Binding var selectedColor: Colour
    var color: Colour
    
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(color.color)
                .onTapGesture {
                    selectedColor = color
                }.overlay(Circle().stroke(.white, lineWidth: 3))
        }
    }
}

struct RoundedRectangleView: View {
    
    @Binding var color: Colour
    private var isWhite: Bool { color == .white }
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 200)
                .foregroundColor(color.color)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isWhite ? .blue : .white , lineWidth: 5)
                )
            Text(color.name)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(isWhite ? .blue : .white)
        }
    }
}

#Preview {
    ContentView()
}

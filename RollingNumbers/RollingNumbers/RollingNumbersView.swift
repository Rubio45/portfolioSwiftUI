//
//  RollingNumbersView.swift
//  RollingNumbers
//
//  Created by Alex Diaz on 21/10/24.
//

import SwiftUI

struct RollingNumbersView: View {
    
    // variables de numeros, Offset que es el desplazamiento y si ya ha aparecido.
    var number: String
    @State private var offset: [CGFloat] = []
    @State private var hasAppeared = false
    
    var body: some View {
        HStack {
            // se hace un for each hasta la extension del numero
            ForEach(0..<number.count, id: \.self) { index in
                // se recorre el array con el indice
                // se crea en Char un array con el string Number y se accede a el a traves del indice.
                let char = Array(number)[index]
                
                // si char es un un numero, entonces se llama la vista SingleDigitView
                if char.isNumber {
                    SingleDigitView(char: char, offset: offset[safe: index] ?? 0)
                } else {
                    // si no es un numero, entonces se muestra de la misma manera, esto para que no haya problemas con los caracteras que no sean numeros.
                    Text(String(char))
                        .font(.system(size: 40, weight: .bold))
                        .frame(width: 25, height: 70)
                }
            }
        }
        .onAppear() {
            // cuando aparezca el numero, entonces se cambia appeared a True y se llama a InitialOffset.
            if !hasAppeared {
                setInitialOffset()
                hasAppeared = true
            }
        }
        // cuando cambie numero, con animacion lineal, se llama a la funcion setOffsets.
        .onChange(of: number) { oldValue, newValue in
            withAnimation(.linear(duration: 0.5)) {
                setOffsets()
            }
        }
    }
    
    // setOffsets functions
    func setOffsets() {
        withAnimation(.easeInOut(duration: 0.5)) {
            // se usa Offset y se le hace un mapeo donde se obtiene una variable char y se devuelve un CGFloat.
            offset = number.map { char -> CGFloat in
                // si existe una Int del String char, entonces que retorne el digito por 70 que es el espacio que ocupa cada numero. Si el char no es un numero, entonces el desplazamiento es 0.
                if let digit = Int(String(char)) {
                    return CGFloat(digit) * 70
                } else {
                    return 0
                }
            }
        }
    }
    
    func setInitialOffset() {
        offset = number.map { _ in CGFloat(700) }
        // se hace un mapeo.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            setOffsets()
        }
    }
}

#Preview {
    RollingNumbersView(number: "$1,234.56")
}

struct SingleDigitView: View {
    
    // char es un simple caracter y offset es lo que se mueve en la pantalla.
    var char: Character
    var offset: CGFloat
    
    var body: some View {
        // geometry para darle offset y mas cosas a la vista.
        GeometryReader { geometry in
            // un VStack para que los numero sean de abajo hacia arriba
            VStack(spacing: 0) {
                // se hace un for each para conseguir cada digito del 0 al 10, sin incluirlo
                ForEach(0..<10) { number in
                    Text("\(number)")
                        .font(.system(size: 40, weight: .bold))
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    // se le da espacio y tamaño al numero.
                }
                // se establece el offset que tiene.
            }.offset(y: -offset)
        }
        .frame(width: 25, height: 70)
        .clipped()
    }
}

// no se que hace esta extension aqui.
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

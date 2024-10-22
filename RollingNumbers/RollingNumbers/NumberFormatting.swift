//
//  NumberFormatting.swift
//  RollingNumbers
//
//  Created by Alex Diaz on 21/10/24.
//

import SwiftUI

struct NumberFormatting: View {
    
    @State var number: Double = 0.0
    
    var formattedNumber: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: number / 100)) ?? "$0.00"
    }
    
    var body: some View {
        VStack {
            RollingNumbersView(number: formattedNumber)
            
            Button {
                withAnimation {
                    number = Double(Int.random(in: 10000...1050030))
                    print("\(number)")
                }
            } label: {
                Text("Next Number")
                    .font(.headline)
                    .padding()
            }
        }
    }
}

#Preview {
    NumberFormatting()
}

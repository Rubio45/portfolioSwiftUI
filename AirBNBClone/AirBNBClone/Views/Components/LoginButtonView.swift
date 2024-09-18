//
//  LoginButtonView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import SwiftUI

struct LoginButtonView: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            print("log in")
        } label: {
            Text("Log in")
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    LoginButtonView(action: {
        print("log in")
    })
}

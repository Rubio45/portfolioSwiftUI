//
//  RecoverPasswordView.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import SwiftUI

struct RecoverPasswordView: View {
    
    @State private var userName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    // TODO: PONER de volver a la pantalla anterior
                } label: {
                    // poner el iono siempre con Bold
                    Image(systemName: "chevron.left")
                        .frame(width: 24, height: 24)
                        .bold()
                        .foregroundColor(.darkBlue)
                }
                Spacer()
            }
           
            Text("Reset Password")
                .font(.system(size: 32,weight: .bold, design: .rounded))
                .foregroundColor(.darkBlue)
            Text("Enter the email address associated with your account")
                .font(.system(size: 18,weight: .medium, design: .rounded))
                .foregroundColor(.darkBlue)
                .padding(10)
                .lineLimit(2)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
            
            inputBox(userEmail: $userName, placeholder: "Email")
            
            Button {
                // TODO: PONER LA LOGICA DE RECUPERAR CONTRASEÑA
            } label: {
                Text("Submit")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, design: .rounded))
            }
            .defaultButtonStyle()
            
            Spacer()
        }.padding(.horizontal, 20)
    }
}

#Preview {
    RecoverPasswordView()
}

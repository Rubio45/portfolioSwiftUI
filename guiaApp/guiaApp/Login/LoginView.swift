//
//  LoginView.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import SwiftUI


/// Crea la vista de Login de la app. Tiene una imagen al principio y un boton para iniciar sesion.
/// Las variables password y userEmail se usan para introducir el email y la contrasena de la cuenta.
struct LoginView: View {
    
    @State private var password: String = ""
    @State private var userEmail: String = ""
    @State private var isShowingPassword: Bool = false
    
    var body: some View {
        VStack {
            // placeholder para una imagen
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 250, height: 250)
                .foregroundColor(.textFieldColor)
            
            Text("Log in")
                .font(.system(size: 32,weight: .bold, design: .rounded))
                .foregroundColor(.darkBlue)
                .padding(.top, 30)
            
            // introducir el email para iniciar sesion
            inputBox(userEmail: $userEmail, placeholder: "Email")
            // poner la contraseña
            passwordBox(isShowingPassword: $isShowingPassword, password: $password, placeholder: "Password")
            
            Button {
                // TODO: PONER LA LOGICA DE INCION DE SESION
            } label: {
                Text("Log in")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, design: .rounded))
            }
            .defaultButtonStyle()
            
            Button {
                
            } label: {
                Text("Forgot password?")
                    .foregroundColor(.mainColor)
                    .padding(.top, 30)
            }
            
            HStack {
                Text("Don't have an account yet?")
                    .foregroundColor(.darkBlue)
                Button {
                    // TODO: PONER LA LOGICA DE CREAR UNA CUENTA
                } label: {
                    Text("Sign up")
                        .foregroundColor(.mainColor)
                }
            }.padding()
            
        }
        .padding()
    }
}

#Preview {
    LoginView()
}

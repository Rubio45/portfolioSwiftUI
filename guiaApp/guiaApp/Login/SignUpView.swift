//
//  SignUpView.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var password: String = ""
    @State private var userEmail: String = ""
    @State private var rePassword: String = ""
    @State private var userName: String = ""
    @State private var isShowingPassword: Bool = false
    @State private var isShowingRePassword: Bool = false
    
    var body: some View {
    
            VStack {
                // placeholder para una imagen
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 250)
                    .foregroundColor(.textFieldColor)
                
                Text("Create Account")
                    .font(.system(size: 32,weight: .bold, design: .rounded))
                    .foregroundColor(.darkBlue)
                    .padding(.top, 30)
                
                //introducir el nombre de la persona
                inputBox(userEmail: $userName, placeholder: "Name")
                
                // introducir el email para crear una cuenta
                inputBox(userEmail: $userEmail, placeholder: "Email")
                // poner la contraseña
                passwordBox(isShowingPassword: $isShowingPassword, password: $password, placeholder: "Password")
                passwordBox(isShowingPassword: $isShowingRePassword, password: $rePassword, placeholder: "Re-password")
                // boton para iniciar sesion
                Button {
                    // TODO: PONER LA LOGICA DE crear una cuneta
                } label: {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, design: .rounded))
                        .fontWeight(.bold)
                }
                .defaultButtonStyle()
                
                
                //poner el texto al final
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.darkBlue)
                    Button {
                        // TODO: PONER LA LOGICA DE CREAR UNA CUENTA
                    } label: {
                        Text("Log In")
                            .foregroundColor(.mainColor)
                    }
                }.padding()
                
            }
            .padding()
    }
}

#Preview {
    SignUpView()
}


struct passwordBox: View {
    
    @Binding var isShowingPassword: Bool
    @Binding var password: String
    var placeholder: String
    
    var body: some View {
        if !isShowingPassword {
            ZStack {
                SecureField(placeholder, text: $password)
                    .padding()
                    .background(Color.textFieldColor)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                Button {
                    isShowingPassword.toggle()
                } label: {
                    Image(systemName: "eye.fill")
                        .foregroundColor(.grayOwnColor)
                }.offset(x: 150, y: -5)
                
            }
        } else {
            ZStack {
                TextField(placeholder, text: $password)
                    .padding()
                    .background(Color.textFieldColor)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                Button {
                    isShowingPassword.toggle()
                } label: {
                    Image(systemName: "eye.slash.fill")
                        .foregroundColor(.grayOwnColor)
                }.offset(x: 150, y: -5)//mover el ojo a la posicion deseada.
            }
        }
    }
}

/// Es una caja para meter texto, que tendra un placeholder y un color de fondo
/// La caja siempre ocupa el tamano total de la vista a lo ancho
struct inputBox: View {
    
    @Binding var userEmail: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $userEmail)
            .padding()
            .background(Color.textFieldColor)
            .cornerRadius(10)
            .padding(.bottom, 10)
    }
}

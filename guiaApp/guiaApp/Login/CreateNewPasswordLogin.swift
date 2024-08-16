//
//  CreateNewPasswordLogin.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import SwiftUI

struct CreateNewPasswordLoginView: View {
    
    @State private var password: String = ""
    @State private var rePassword: String = ""
    @State private var isShowingPassword: Bool = false
    @State private var isShowingRePassword: Bool = false
    
    var body: some View {
        VStack {
            Text("Create New Password")
                .font(.system(size: 32,weight: .bold, design: .rounded))
                .foregroundColor(.darkBlue)
                .padding(.top, 30)
            Text("Your new password must be different from previous used passwords")
                .font(.system(size: 16,weight: .medium, design: .rounded))
                .foregroundColor(.darkBlue)
                .lineLimit(2)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
                .padding(.top,5)
                .padding(.bottom, 30)
            
            passwordBox(isShowingPassword: $isShowingPassword, password: $password, placeholder: "Password")
            passwordBox(isShowingPassword: $isShowingRePassword, password: $rePassword, placeholder: "Re-password")
            
            Button {
                // TODO: PONER LA LOGICA DE RECUPERAR CONTRASEÑA
            } label: {
                Text("Reset Password")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, design: .rounded))
            }
            .defaultButtonStyle()
            
            Spacer()
        }.padding()
    }
}
#Preview {
    CreateNewPasswordLoginView()
}

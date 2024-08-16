//
//  SuccessEmailSentView.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import SwiftUI

struct SuccessEmailSentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Spacer()
            Text("Check your email")
                .font(.system(size: 24,weight: .bold, design: .rounded))
                .foregroundColor(.darkBlue)
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.mainColor)
                .font(.system(size: 100))
            Text("Change the password with link in the email")
                .font(.system(size: 18,weight: .medium, design: .rounded))
                .foregroundColor(.darkBlue)
                .lineLimit(2)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                // TODO: PONER LA LOGICA DE RECUPERAR CONTRASEÑA
            } label: {
                Text("Go Back")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, design: .rounded))
            }
            .defaultButtonStyle()
        }.padding()
    }
}

#Preview {
    SuccessEmailSentView()
}

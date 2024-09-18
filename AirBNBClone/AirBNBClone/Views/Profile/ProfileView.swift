//
//  ProfileView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import SwiftUI

struct ProfileView: View {
    
    let profileOptions: [ProfileOptionModel] = [ ProfileOptionModel(image: "gear", title: "Settings"),
        ProfileOptionModel(image: "questionmark.circle", title: "Help"),
        ProfileOptionModel(image: "info", title: "Visit the Help Center"),
    ]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Log in to start planning your next trip!")
                }
                LoginButtonView(action: {
                    print("log in")
                })
                
                HStack {
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .underline()
                        .fontWeight(.semibold)
                }
                .font(.caption)
            }
            
            VStack(spacing: 24) {
                ForEach(profileOptions, id: \.id) { option in
                    ProfileOptionRowView(image: option.image, title: option.title)
                }
            }.padding(.vertical)
        }
    }
}

#Preview {
    ProfileView()
}


// quick options

struct ProfileOptionModel: Identifiable {
    var id = UUID()
    let image: String
    let title: String
}

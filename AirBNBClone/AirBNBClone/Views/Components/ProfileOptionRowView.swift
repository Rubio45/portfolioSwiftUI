//
//  ProfileOptionRowView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 17/9/24.
//

import SwiftUI

struct ProfileOptionRowView: View {
    
    let image: String
    let title: String
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                Image(systemName: image)
                    .frame(width: 32)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black)
                    .frame(width: 40)
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(image: "gear", title: "Settings")
}

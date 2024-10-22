//
//  PostBar.swift
//  RollingNumbers
//
//  Created by Alex Diaz on 21/10/24.
//

import SwiftUI

struct PostBar: View {
    
    @State var like = 65
    @State var retweets = 10
    @State var bookmarks = 12
    @State var hasLiked = false
    @State var hasRetweeted = false
    @State var hasBookmarked = false
    
    var body: some View {
        HStack (spacing: 24) {
            InteractionButton(icon: "arrow.2.squarepath", count: $retweets, isActive: $hasRetweeted, activeColor: .green)
            InteractionButton(icon: hasLiked ? "heart.fill" : "heart", count: $like, isActive: $hasLiked, activeColor: .pink)
            InteractionButton(icon: hasBookmarked ? "bookmark.fill" : "bookmark", count: $bookmarks, isActive: $hasBookmarked, activeColor: .white)
        }
        .foregroundStyle(.white)
        .padding()
        .background(Color(.systemGray4), in: .rect(cornerRadius: 14))
        .scaleEffect(1.5)
    }
}

#Preview {
    PostBar()
}

struct InteractionButton: View {
    var icon: String
    
    @Binding var count: Int
    @Binding var isActive: Bool
    var activeColor: Color
    
    var body: some View {
        HStack {
            Button {
                if isActive {
                    count -= 1
                } else {
                    count += 1
                }
                isActive.toggle()
            } label: {
                Image(systemName: icon)
                    .foregroundStyle(isActive ? activeColor : .gray)
                    .frame(width: 20, height: 20)
            }
            
            RollingNumbersView(number: String(count))
                .frame(width: 20, height: 20)
                .scaleEffect(0.4)
        }
    }
}

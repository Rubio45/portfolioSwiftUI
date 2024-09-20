//
//  SearchView.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var username: String = ""
    @State var showContentView = false
    
    var body: some View {
        ZStack {
            Color(Color.backgroundMain)
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 100)
                
                Text("Github Searcher")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                HStack {
                    TextField("Enter Github username", text: $username)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color.main)
                        }
                        .background(Color.backgroundSecondary)
                    Button {
                        withAnimation(.snappy) {
                            showContentView = true
                        }
                    } label: {
                        Text("Search")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.main)
                            .cornerRadius(8)
                    }
                }
                Spacer()
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showContentView) {
            ContentView(gitHubFetcher: GithubFetcher(username: username), isPresenting: $showContentView)
        }
    }
}
#Preview {
    SearchView()
}

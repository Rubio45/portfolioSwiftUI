//
//  ContentView.swift
//  GithubSearcher
//
//  Created by Alex Diaz on 19/9/24.
//

import SwiftUI

struct ContentView: View {
    
    var gitHubFetcher = GithubFetcher(username: "midudev")
    @State private var user: GitHubUser?
    @State private var followers: [GitHubFollower]? = []
    @Binding var isPresenting: Bool
    
    var body: some View {
        
        ZStack {
            Color.backgroundMain
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isPresenting = false
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .padding()
                    }
                    Spacer()
                }.frame(height: UIScreen.main.bounds.height / 100)
                if let avatarUrlString = user?.avatarUrl, let avatarUrl = URL(string: avatarUrlString) {
                    AsyncImage(url: avatarUrl, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.main,lineWidth: 2)
                            }
                            .shadow(color: Color.main.opacity(0.5), radius: 20)
                    }, placeholder: {
                        ProgressView()
                    })
                    .frame(width: 120, height: 120)
                }
                VStack(spacing: 8) {
                    Text(user?.name ?? "Login Placeholder")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("@" + (user?.login ?? "Login Placeholder"))
                        .font(.subheadline)
                    
                    Text(user?.bio ?? "Bio Placeholder")
                        .lineLimit(3)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                        .minimumScaleFactor(0.3)
                }
                
                HStack(spacing: 64) {
                    StatsView(statsName: "Followers", statsValue: String(user?.followers ?? 0 ))
                    StatsView(statsName: "Following", statsValue: String(user?.following ?? 0 ))
                    StatsView(statsName: "Repos", statsValue: String(user?.publicRepos ?? 0 ))
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Divider()
                // header of basic info
                HStack {
                    Text("Basic information")
                        .font(.title3.bold())
                    Spacer()
                    
                    Button {
                        print("Show more")
                    } label: {
                        Text("Show More")
                            .foregroundStyle(.main)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }.padding(8)
                
                
                HStack {
                    ContactView(image: "building.2", name: "Company", value: user?.company ?? "UAM")
                    ContactView(image: "bird", name: "Twitter", value: "@\(user?.twitterUsername ?? "Twitter")")
                    ContactView(image: "pin", name: "Location", value: user?.location ?? "Managua")
                }
                .padding(.bottom, 8)
                Divider()
                HStack {
                    Text("Followers")
                        .font(.title3.bold())
                    Spacer()
                }
                .padding(.horizontal, 8)
                VStack {
                    if let followers = followers {
                        if followers.isEmpty {
                            VStack {
                                Spacer()
                                Text("No followers yet")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white.opacity(0.7))
                                Spacer()
                            }
                        } else {
                            ScrollView {
                                ForEach(followers, id: \.id) { follower in
                                    HStack {
                                        if let avatarUrl = URL(string: follower.avatarUrl) {
                                            
                                            AsyncImage(url: avatarUrl) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .clipShape(Circle())
                                                    .frame(width: 50, height: 50)
                                            } placeholder: {
                                                ProgressView()
                                            }

                                        }
                                        Text(follower.login)
                                        Spacer()
                                    }
                                    .padding()
                                    .background(Color.backgroundSecondary)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                    } else {
                        ProgressView("Loading followers...")
                    }
                }
                Spacer()
            }
            .padding()
         }
        .foregroundStyle(.white)
        .opacity(isPresenting ? 1 : 0)
        .task {
            do {
                self.user = try await gitHubFetcher.getUser()
                print("User: \(String(describing: user))")
                
                self.followers = try await gitHubFetcher.getFollowers(user: self.user!)
                print("Followers: \(String(describing: followers))")
            } catch NetworkError.invalidData {
                print("Invalid Data")
            } catch NetworkError.invalidResponse {
                print("Invalid Response")
            } catch NetworkError.invalidURL {
                print("Invalid URL")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ContentView(isPresenting: .constant(true))
}


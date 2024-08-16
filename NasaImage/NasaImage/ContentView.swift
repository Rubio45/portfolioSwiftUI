//
//  ContentView.swift
//  NasaImage
//
//  Created by Alex Diaz on 15/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var apodFactory = APODFactory()
    
    var body: some View {
        ScrollView {
            VStack {
                if let imageUrl = apodFactory.apod?.imageUrl, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        case .failure(let error):
                            Text("Error: \(error.localizedDescription)")
                        @unknown default:
                            Text("Unknown error")
                        }
                    }
                    .frame(height: 300)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                HStack {
                    Text(apodFactory.apod?.title ?? "")
                        .font(.title)
                        .font(.system(.title3, design: .rounded))
                        .foregroundStyle(.black)
                    Spacer()
                    Text(apodFactory.apod?.date ?? "")
                        .font(.system(.caption2, design: .rounded))
                        .foregroundStyle(.black)
                }.padding(.bottom, 20)
                Text(apodFactory.apod?.explanation ?? "")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.black)
            }
            .padding()
            .task {
                apodFactory.fetchFromApiAPOD()
            }
        }
    }
}

#Preview {
    ContentView()
}

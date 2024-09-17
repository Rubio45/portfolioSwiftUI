//
//  DestinationSearchView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI

enum DestinationSearchViewType {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var isShowed: Bool
    @State private var destination: String = ""
    @State private var selectedOption: DestinationSearchViewType = .location
    
    var body: some View {
        VStack (spacing: 16) {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        isShowed.toggle()
                    }
                    print("close button pressed")
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                        .foregroundStyle(.black)
                        .overlay {
                            Circle()
                                .stroke(Color(.systemGray4), lineWidth: 2)
                                .frame(width: 30, height: 30)
                        }
                }
                Spacer()
                
                if !destination.isEmpty {
                    Button {
                        destination = ""
                    } label: {
                        Text("Clear")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            // where to
            VStack (alignment: .leading) {
                if selectedOption == .location {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            TextField("Search destinations", text: $destination)
                                .font(.subheadline)
                            Spacer()
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        }
                    
                } else {
                    FoldSearchView(title: "Where", description: "Add destination")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64 )
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .location
                }
            }
            
            
            // date selection view
            VStack (alignment: .leading) {
                if selectedOption == .dates {
                    
                } else {
                    FoldSearchView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64 )
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .dates
                }
            }
            // num guest view
            VStack (alignment: .leading) {
                if selectedOption == .guests {
                    
                } else {
                    FoldSearchView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64 )
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .guests
                }
            }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(isShowed: .constant(true))
}


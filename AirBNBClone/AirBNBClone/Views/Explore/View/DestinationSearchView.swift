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
    
    @State private var fromDate: Date = Date()
    @State private var toDate: Date = Date()
    @State private var guests: Int = 0
    
    var body: some View {
        VStack (spacing: 16) {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        isShowed.toggle()
                    }
                    print("close button pressed")
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                if !destination.isEmpty {
                    Button {
                        destination = ""
                    } label: {
                        Text("Clear")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding()
            
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
            .modifier(FoldSearchViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64 )
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .location
                }
            }
            
            
            // date selection view
            VStack (alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                    VStack {
                        DatePicker("From", selection: $fromDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $toDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    FoldSearchView(title: "When", description: "Add dates")
                }
            }
            .modifier(FoldSearchViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64 )
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selectedOption = .dates
                }
            }
            // num guest view
            VStack (alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(guests) adults")
                    } onIncrement: {
                        guests += 1
                    } onDecrement: {
                        guard guests > 0 else { return }
                        guests -= 1
                    }
                } else {
                    FoldSearchView(title: "Who", description: "Add guests")
                }
            }
            .modifier(FoldSearchViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64 )
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

// modificador personalizado
struct FoldSearchViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

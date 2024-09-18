//
//  ListingDetailView.swift
//  AirBNBClone
//
//  Created by Alex Diaz on 16/9/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background(
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        )
                        .padding(.leading, 32)
                        .padding(.top, 48)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("4.86")
                        
                        Text("•")
                            
                        Text("567 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity ,alignment: .leading)
            
            Divider()
            
            // host info view
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire Villa hosted by Alex Yañez")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    
                    HStack (spacing: 2) {
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("host")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // Listing Features
            VStack (alignment: .leading, spacing: 16) {
                ListingFeaturesView(image: "appletv", title: "Muy bueno", description: "exceltente opiniones para dormir tranquilo en alta mar y sirve para dormir y ver el televisor tranquilamente")
                ListingFeaturesView(image: "medal", title: "Muy bueno", description: "exceltente opiniones para dormir tranquilo en alta mar y sirve para dormir y ver el televisor tranquilamente")
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            VStack (alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 16) {
                        ForEach(0..<5) {bedroom in
                            VStack (spacing: 8) {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                        }
                    }
                }.scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            //listing offers
            VStack (alignment: .leading, spacing: 16) {
                Text ("What this place offers")
                    .font(.headline)
                
                ForEach(0..<5) {feature in
                    ListingOfferingView(image: "wifi", title: "Wi-Fi")
                }
            }.padding()
            
            Divider()
            
            VStack (alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }.padding()
        }
        .toolbar(.hidden, for: .tabBar) // hide the tabBar on this screen
        .ignoresSafeArea()
        .padding(.bottom, 72)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15-20")
                            .font(.footnote)
                            .underline()
                    }
                    Spacer()
                    
                    Button {
                        // add some logic to reserve.
                    } label: {
                        Text("Reserve")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .frame(width: 140, height: 40)
                            .background(Color.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}

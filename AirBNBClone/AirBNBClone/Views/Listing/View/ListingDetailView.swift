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
    let listing: ListingModel
    @State private var cameraPostition: MapCameraPosition
    
    init (listing: ListingModel) {
        self.listing = listing
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._cameraPostition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing, height: 320)
                
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
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text(String(format: "%.2f", listing.rating))
                        
                        Text("•")
                            
                        Text("567 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity ,alignment: .leading)
            
            Divider()
            
            // host info view
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type.title) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    
                    HStack (spacing: 2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // Listing Features
            VStack (alignment: .leading, spacing: 16) {
                ForEach(listing.features) {feature in
                    ListingFeaturesView(image: feature.imageName, title: feature.title, description: feature.subtitle)
                }
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            VStack (alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) {bedroom in
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
                
                ForEach(listing.amenities) {feature in
                    ListingOfferingView(image: feature.imageName, title: feature.title)
                }
            }.padding()
            
            Divider()
            
            VStack (alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPostition)
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
                        Text(String(format: "$%.0f", listing.pricePerNight))
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
    ListingDetailView(listing: DeveloperPreview.shared.mockListings[0])
}

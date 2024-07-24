//
//  ProductListView.swift
//  EBay3D
//
//  Created by Alex Diaz on 23/7/24.
//

import SwiftUI

struct ProductListView: View {
    
    @State private var searchText: String = ""
    @State private var productTypeCount: Int = 0
    var category: Category
    
    var body: some View {
        // para poner deslizar en la vista
        ScrollView {
            VStack(alignment: .leading) {
                
                // filtrar por la categoria
                let filteredProducts = products.filter { $0.category == category.name }
                
                // mostrar la cantidad de productos que existe
                Text("\(filteredProducts.count) products")
                    .font(.headline)
                    .padding()
                SearchBarView(searchText: $searchText, category: category)
                
                // Definir los elementos del grid
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),

                ]
                // construyendo una lazy grid para agrupar de 4 en 4.
                LazyVGrid(columns: columns, spacing: 10) {
                    // recorrer los productos por categoria
                    ForEach(filteredProducts, id: \.self) { product in
                        // usar una anvigationLink para llevar a la vista de detalles
                        NavigationLink(destination: ProductCardDetailsView(product: product)) {
                            // diseñar la tarjeta
                            CardViewProduct(product: product)
                            
                        }
                        //quita el boton en forma redonda
                        .buttonStyle(PlainButtonStyle()) // para eliminar el efecto predeterminado del botón
                    }
                }
                .padding()
                
            }
            .padding()
            .navigationTitle(category.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                        Text("Publish new product")
                    }
                }
            }
        }
    }
}



#Preview(windowStyle: .automatic) {
    ProductListView(category: categories[10])
}

struct ProductCardDetailsView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(product.image)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(10)
            Text(product.category)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(product.name)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Image(systemName: "star")
                Text("Rating: \(product.price, specifier: "%.1f")")
                Spacer()
                Text("$\(product.price, specifier: "%.2f")")
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }.clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
        .background(Color(.systemBackground).opacity(0.8))
    }
}

struct SearchBarView: View {
    
    @Binding var searchText: String
    var category: Category
    
    var body: some View {
        HStack {
            Image(systemName: "mic.fill")
            
            TextField("Search", text: $searchText, prompt: {
                Text("Search in \(category.name)")
                    .foregroundColor(.white)
                
            }())
            .padding(.horizontal)
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
        .background(Color.black.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CardViewProduct: View {
    
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text("$\(product.price, specifier: "%.2f") | \(product.name)")
                .foregroundStyle(.white)
                .font(.system(.headline, design: .rounded))
                .lineLimit(1)
            
        }
        .padding()
        .background(Color.black.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

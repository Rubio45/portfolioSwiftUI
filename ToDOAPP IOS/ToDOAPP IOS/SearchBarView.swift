//
//  SearchBarView.swift
//  ToDOAPP IOS
//
//  Created by Alex Diaz on 17/8/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    private var text: Binding<String> {
        return Binding<String> (
            get: {
                self.searchText
            },
            set: {
                self.searchText = $0.uppercased()
            }
        )
    }
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search a task...", text: self.text)
                    .padding(8)
                    .padding(.horizontal, 24)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isEditing {
                                Button {
                                    self.searchText = ""
                                } label: {
                                    Image(systemName: "x.circle.fill")
                                        .foregroundStyle(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    }
            }
            .padding(.horizontal, 16)
            .onTapGesture {
                withAnimation {
                    self.isEditing = true
                }
            }
            //Boton cancelar
            if self.isEditing {
                Button {
                    withAnimation {
                        self.isEditing = false
                        self.searchText = ""
                        //ocultar el teclado. UIAPLICATION ES donde se contrala todo en ios
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                } label: {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
            }
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}

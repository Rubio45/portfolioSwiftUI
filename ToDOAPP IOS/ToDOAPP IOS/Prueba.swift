//
//  Prueba.swift
//  ToDOAPP IOS
//
//  Created by Alex Diaz on 16/8/24.
//

import SwiftUI

struct Prueba: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        SearchView(searchText: self.$searchText)
    }
}

#Preview {
    Prueba()
}

//integrar la barra de busqueda en UIKit e integrandolo a SwiftUI
struct SearchView: UIViewRepresentable {
    
    @Binding var searchText: String
    
    func makeUIView(context: Context) -> UISearchBar {
        
        let searchBar = UISearchBar()
        
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Search a task..."
        
        searchBar.delegate = context.coordinator
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self.$searchText)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        //el coordinador necesita una vairbale de texto
        @Binding var searchText: String
        //Constructor de la clase
        init(_ searchText: Binding<String>) {
            //cuando es binding se usa un _ delante del nombre
            self._searchText = searchText
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBar.showsCancelButton = true
            self.searchText = searchText
            
            print("el nuevo texto es: \(searchText)")
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.searchText = ""
            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
        
        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            return true
        }
    }
}

//
//  ContactListVCExtension.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit

extension ContactListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            updateData(contactList: contactList)
            return
        }
        self.filteredContactList = contactList.filter {
            $0.name!.lowercased().contains(filter.lowercased())
        }
        updateData(contactList: filteredContactList)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateData(contactList: contactList)
    }
}

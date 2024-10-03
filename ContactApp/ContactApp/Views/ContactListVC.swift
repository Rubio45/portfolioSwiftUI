//
//  ContactListVC.swift
//  ContactApp
//
//  Created by Alex Diaz on 28/9/24.
//

import UIKit

class ContactListVC: UIViewController {
    
    typealias DataSource = UITableViewDiffableDataSource<LetterSection, ContactModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<LetterSection, ContactModel>

    var filteredContactList = [ContactModel]()
    var dataSource: DataSource!
    var contactList = [ContactModel]()
    private var tableView: UITableView!
    let controller = MainController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor                    = .systemBackground
        UINavigationBar.appearance().tintColor  = .systemTeal
        configureTableView()
        configureDataSource()
        createAddButton()
        configureSearchController()
        updateData(contactList: contactList)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        getData()
    }
    
    private func getData() {
        contactList = controller.getContacts()
        updateData(contactList: contactList)
    }
    
    // MARK: - CollectionView
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.delegate        = self
        tableView.backgroundColor = .systemBackground
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.reuseIdentifier)
    }
    // MARK: DataSource
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView) { (tableView, indexPath, itemIdentifier) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.reuseIdentifier, for: indexPath) as? ContactCell
            cell?.setContact(contactModel: itemIdentifier)
            return cell
        }
    }
    // MARK: UPDATE DATA
    func updateData(contactList: [ContactModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.Z])
        snapshot.appendItems(contactList)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    // MARK: Add Button
    private func createAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addContact))
    }
    
    @objc private func addContact() {
        // print("contact added")
        let addContact = AddContactViewController(controller: controller)
        addContact.onContactAdded = { [weak self] in
            self?.getData()
        }
        present(UINavigationController(rootViewController: addContact), animated: true)
    }
    // MARK: Search Controller
    private func configureSearchController() {
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.placeholder                  = "Search..."
        navigationItem.searchController                         = searchController
        navigationItem.hidesSearchBarWhenScrolling              = true
        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.searchBar.delegate                     = self
    }
}


extension ContactListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // use DataSource to get the contact
        if let contact = dataSource.itemIdentifier(for: indexPath) {
            print("contact: \(String(describing: contact.name))")
        }
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            if let contactToDelete = self.dataSource.itemIdentifier(for: indexPath) {
                self.controller.deleteContact(contact: contactToDelete)
                completion(true)
                self.getData()
            }
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeActions
    }
}

//
//  MainController.swift
//  ContactApp
//
//  Created by Alex Diaz on 2/10/24.
//

import Foundation

final class MainController {
    private let coreDataManager = CoreDataManager(modelName: "ContactApp")
    
    func getContacts() -> [ContactModel] {
        let fetchRequest = ContactModel.fetchRequest()
        
        do {
            let contacts = try coreDataManager.context.fetch(fetchRequest)
            return contacts
        } catch {
            print("Fetch Error: \(error.localizedDescription)")
        }
        return []
    }
    
    func saveContact(name: String,
                     phoneNumber: String? = "",
                     email: String = "",
                     lastName: String = "",
                     jobTitle: String = "",
                     company: String = "") {
        
        let newContact                  = ContactModel(context: coreDataManager.context)
        newContact.name                 = name
        newContact.email                = email
        newContact.phoneNumber          = phoneNumber
        newContact.company              = company
        newContact.jobTitle             = jobTitle
        newContact.lastName             = lastName
        newContact.id                   = UUID()
        newContact.isFavorite           = false
        
        coreDataManager.save()
    }
    
    func deleteContact(contact: ContactModel) {
        coreDataManager.context.delete(contact)
        coreDataManager.save()
    }
    
    func toggleFavorite(contact: ContactModel) {
        contact.isFavorite.toggle()
        coreDataManager.save()
    }
}

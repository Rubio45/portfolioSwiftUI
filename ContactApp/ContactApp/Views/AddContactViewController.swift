//
//  AddContactViewController.swift
//  ContactApp
//
//  Created by Alex Diaz on 29/9/24.
//

import UIKit
import PhotosUI

class AddContactViewController: UIViewController {

    // MARK: Closure
    var onContactAdded: (() -> Void)?
    
    // MARK: VIEWS
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var basicInfoView: UIView! // I might use a UIStackView but I think it's better on this way. I would type less constraints with a UIStackView
    private var contactInfoView: UIView!
    private var controller: MainController
    var imageView                           = ContactImageView(frame: .zero)
    private var nameField                   = ContactTextField(frame: .zero, keyboardType: .default, placeholder: "Name")
    private var emailField                  = ContactTextField(frame: .zero, keyboardType: .emailAddress, placeholder: "Email")
    private var phoneNumberField            = ContactTextField(frame: .zero, keyboardType: .phonePad, placeholder: "Phone Number")
    private var companyField                = ContactTextField(frame: .zero, keyboardType: .default, placeholder: "Company")
    private var jobTitleField               = ContactTextField(frame: .zero, keyboardType: .default, placeholder: "Job Title")
    // private var addressField                = ContactTextField(frame: .zero, keyboardType: .default, placeholder: "Address")
    private var lastNameField               = ContactTextField(frame: .zero, keyboardType: .default, placeholder: "Last Name")
    
   // MARK: ADD PHOTOS
    private let addPhotoButton  = ContactButton(frame: .zero, title: "Add Photo")
    private let takePhotoButton = ContactButton(frame: .zero, title: "Take Photo")
    let padding: CGFloat        = 20
    let heightItem: CGFloat     = 45
    
    init(controller: MainController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupUI()
        setNavigationBar()
        setInfoView()
        setContactInfo()
        addButtonTarget()
    }
    // MARK: Navigation
    private func setNavigationBar() {
        navigationItem.rightBarButtonItem                   = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveContact))
        navigationItem.title                                = "Add Contact"
        navigationItem.leftBarButtonItem                    = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        UINavigationBar.appearance().prefersLargeTitles     = false
    }
    // MARK: Setting UI
    private func setupUI() {
        
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        contentView = UIView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints  = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator               = false
        
        scrollView.addSubview(contentView)
        // MARK: ScrollView and Navigation
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 820)
        ])
    
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image                                     = UIImage(systemName: "camera")
        imageView.tintColor                                 = .systemGray
        imageView.layer.cornerRadius                        = 50
        imageView.backgroundColor                           = .secondarySystemBackground
        
        contentView.addSubview(imageView)
        contentView.addSubview(addPhotoButton)
        contentView.addSubview(takePhotoButton)
       // MARK: Constraints
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            addPhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            addPhotoButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 70),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 100),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 45),
            
            takePhotoButton.topAnchor.constraint(equalTo: addPhotoButton.topAnchor),
            takePhotoButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -70),
            takePhotoButton.widthAnchor.constraint(equalToConstant: 100),
            takePhotoButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    // MARK: INFO VIEW
    private func setInfoView() {
        basicInfoView = UIView()
        contentView.addSubview(basicInfoView)
        basicInfoView.layer.cornerRadius = 10
        basicInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            basicInfoView.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: padding),
            basicInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            basicInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            basicInfoView.heightAnchor.constraint(equalToConstant: CGFloat(heightItem * 4))
        ])
        
        let itemList = [nameField, lastNameField, companyField, jobTitleField]
        for item in itemList {
            basicInfoView.addSubview(item)
            
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: basicInfoView.leadingAnchor, constant: 5),
                item.trailingAnchor.constraint(equalTo: basicInfoView.trailingAnchor, constant: -5),
                item.heightAnchor.constraint(equalToConstant: heightItem)
            ])
        }
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: basicInfoView.topAnchor),
            lastNameField.topAnchor.constraint(equalTo: nameField.bottomAnchor),
            companyField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor),
            jobTitleField.topAnchor.constraint(equalTo: companyField.bottomAnchor),
            jobTitleField.bottomAnchor.constraint(equalTo: basicInfoView.bottomAnchor),
        ])
    }
    // MARK: ContactInfo
    private func setContactInfo() {
        contactInfoView = UIView()
        contactInfoView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contactInfoView)
        let itemList = [phoneNumberField, emailField]
        
        for item in itemList {
            contactInfoView.addSubview(item)
            
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: basicInfoView.leadingAnchor, constant: 5),
                item.trailingAnchor.constraint(equalTo: basicInfoView.trailingAnchor, constant: -5),
                item.heightAnchor.constraint(equalToConstant: heightItem)
            ])
        }
        
        NSLayoutConstraint.activate([
            contactInfoView.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: 20),
            contactInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            contactInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            contactInfoView.heightAnchor.constraint(equalToConstant: CGFloat(heightItem * 2)),
            
            phoneNumberField.topAnchor.constraint(equalTo: contactInfoView.topAnchor),
            emailField.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor),
            emailField.bottomAnchor.constraint(equalTo: contactInfoView.bottomAnchor),
        ])
    }
    
    // MARK: Button actions
    
    private func addButtonTarget() {
        addPhotoButton.addTarget(self, action: #selector(pickPhoto), for: .touchUpInside)
        takePhotoButton.addTarget(self, action: #selector(takePhoto), for: .touchUpInside)
    }
    
    @objc func saveContact() {
        guard let name = nameField.text, !name.isEmpty else {
            nameField.placeholder = "* Name is required"
            print("Introduce el nombre")
            
            return
        }
        
        controller.saveContact(name: name,
                               phoneNumber: phoneNumberField.text ?? "",
                               email: emailField.text ?? "",
                               lastName: lastNameField.text ?? "",
                               jobTitle: jobTitleField.text ?? "",
                               company: companyField.text ?? "")
        onContactAdded?()
        dismiss(animated: true)
    }
    
    @objc func cancel() {
        print("Cancelado")
        dismiss(animated: true)
    }
    
    @objc func pickPhoto() {
        // set configuration
        var configuration               = PHPickerConfiguration()
        configuration.filter            = .images
        configuration.selectionLimit    = 1
        // set picker
        let picker                      = PHPickerViewController(configuration: configuration)
        picker.delegate                 = self
        present(picker, animated: true)
    }
    
    @objc func takePhoto() {
        let imagePicker             = UIImagePickerController()
        imagePicker.delegate        = self
        imagePicker.sourceType      = .camera
        present(imagePicker, animated: true)
    }
}

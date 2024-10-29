//
//  RegisterViewController.swift
//  UITestDEMOAPP
//
//  Created by Alex Diaz on 26/10/24.
//

import UIKit

class RegisterViewController: UIViewController {

    let titleLabel = TitleLabel(text: "Register")
    let registerButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nameTextField = BasicTextField(placeholder: "Name", secureTextFieldEntry: false)
    let usernameTextField = BasicTextField(placeholder: "Username", secureTextFieldEntry: false)
    let phoneTextField = BasicTextField(placeholder: "Phone Number", secureTextFieldEntry: false)
    let passwordTextField = BasicTextField(placeholder: "Password", secureTextFieldEntry: true)
    let repeatPasswordTextField = BasicTextField(placeholder: "Repeat Password", secureTextFieldEntry: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configure()
        setAccesibilityIdentifier()
    }
    
    func configure() {
        titleLabel.textAlignment = .center
        [titleLabel, registerButton, nameTextField, usernameTextField, phoneTextField, passwordTextField, repeatPasswordTextField].forEach { item in
            view.addSubview(item)
            
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
        }
        
        [registerButton, nameTextField, usernameTextField,phoneTextField, passwordTextField, repeatPasswordTextField].forEach { item in
            item.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            usernameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            phoneTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 30),
            
            passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 60),
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            
            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 30),
            
        ])
    }
    
    private func setAccesibilityIdentifier() {
        titleLabel.accessibilityIdentifier = ConstantsAccessibilityRegisterView.titleLabel
        nameTextField.accessibilityIdentifier = ConstantsAccessibilityRegisterView.nameTextField
        usernameTextField.accessibilityIdentifier = ConstantsAccessibilityRegisterView.usernameTextField
        phoneTextField.accessibilityIdentifier = ConstantsAccessibilityRegisterView.phoneNumberTextField
        passwordTextField.accessibilityIdentifier = ConstantsAccessibilityRegisterView.passwordTextField
        repeatPasswordTextField.accessibilityIdentifier = ConstantsAccessibilityRegisterView.repeatPasswordTextField
        registerButton.accessibilityIdentifier = ConstantsAccessibilityRegisterView.registerButton
    }

    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }

}

//
//  LoginViewController.swift
//  UITestDEMOAPP
//
//  Created by Alex Diaz on 26/10/24.
//

import UIKit

class LoginViewController: UIViewController {

    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray4
        button.layer.borderColor = .init(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let titleLabel = TitleLabel(text: "Login")
    let passwordLabel = BasicLabel(text: "Password")
    let passwordTextField = BasicTextField(placeholder: "Enter the password...", secureTextFieldEntry: true)
    let emailLabel = BasicLabel(text: "Email")
    let emailTextField = BasicTextField(placeholder: "Enter the username...", secureTextFieldEntry: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addTargetButtons()
        setAccessibilityIdentifier()
    }
    

    func configure () {
       
        titleLabel.textAlignment = .center
        
        [loginButton, registerButton, divider, passwordLabel, passwordTextField, emailLabel, emailTextField, titleLabel].forEach { item in
            view.addSubview(item)
            
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
        }
        
        [emailLabel, passwordLabel].forEach { item in
            NSLayoutConstraint.activate([
                item.heightAnchor.constraint(equalToConstant: 20),
            ])
        }
        
        [passwordTextField, emailTextField, loginButton, registerButton].forEach{ item in
            NSLayoutConstraint.activate([
                item.heightAnchor.constraint(equalToConstant: 40),
            ])
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            
            divider.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            divider.heightAnchor.constraint(equalToConstant: 2),
            
            registerButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 10)
        ])
    }
    
    func setAccessibilityIdentifier() {
        titleLabel.accessibilityIdentifier = ConstantsAccessibilityLoginView.titleLabel
        emailLabel.accessibilityIdentifier = ConstantsAccessibilityLoginView.usernameLabel
        passwordLabel.accessibilityIdentifier = ConstantsAccessibilityLoginView.passwordLabel
        passwordTextField.accessibilityIdentifier = ConstantsAccessibilityLoginView.passwordTextField
        emailTextField.accessibilityIdentifier = ConstantsAccessibilityLoginView.usernameTextField
        
        loginButton.accessibilityIdentifier = ConstantsAccessibilityLoginView.loginButton
        registerButton.accessibilityIdentifier = ConstantsAccessibilityLoginView.registerButton
    }
    
    func addTargetButtons() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func registerButtonTapped() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func loginButtonTapped() {
        let registerVC = MainViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}

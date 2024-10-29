//
//  Constants.swift
//  UITestDEMOAPP
//
//  Created by Alex Diaz on 26/10/24.
//

import Foundation

// viewElement
enum ConstantsAccessibilityLoginView {
    // TextField
    static let passwordTextField        = "loginPasswordTextField"
    static let usernameTextField        = "loginUsernameTextField"
    // Labels
    static let usernameLabel            = "loginUsernameLabel"
    static let passwordLabel            = "loginPasswordLabel"
    static let titleLabel               = "loginTitleLabel"
    // Buttons
    static let registerButton           = "loginRegisterButton"
    static let loginButton              = "loginLoginButton"
}

enum ConstantsAccessibilityRegisterView {
    // Button & Label
    static let registerButton           = "registerRegisterButton"
    static let titleLabel               = "registerTitleLabel"
    // TextFields
    static let passwordTextField        = "registerPasswordTextField"
    static let repeatPasswordTextField  = "registerRepeatPasswordTextField"
    static let nameTextField            = "registerNameTextField"
    static let usernameTextField        = "registerUsernameTextField"
    static let phoneNumberTextField     = "registerPhoneNumberTextField"
}

enum ConstantsAccessibilityMainView {
    static let titleLabel           = "mainTitleLabel"
    static let imageView            = "mainImageView"
    static let tableView            = "mainTableView"
    static let cellView             = "mainCellView"
}

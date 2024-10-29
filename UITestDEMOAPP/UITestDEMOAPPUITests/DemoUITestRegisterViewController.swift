//
//  DemoUITestRegisterViewController.swift
//  UITestDEMOAPPUITests
//
//  Created by Alex Diaz on 28/10/24.
//

import XCTest
@testable import UITestDEMOAPP

class DemoUITestRegisterViewControllerTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
        let loginRegisterButton = app.buttons[ConstantsAccessibilityLoginView.registerButton]
        loginRegisterButton.tap()
    }
    
    func testRegisterButton() {
        let registerButton = app.buttons[ConstantsAccessibilityRegisterView.registerButton]
        XCTAssertTrue(registerButton.exists, "El boton debe de existir en la RegisterView")
    }
    
    func testUsernameTextField() {
        let usernameTextField = app.textFields[ConstantsAccessibilityRegisterView.usernameTextField]
        XCTAssertTrue(usernameTextField.exists, "El campo debe de existir")
        usernameTextField.tap()
        let string = "Test"
        usernameTextField.typeText("Test")
        XCTAssertEqual(usernameTextField.value as! String, string, "El texto no es el correcto")
    }
    
    func testPhoneNumberTextField() {
        let phoneNumberTextField = app.textFields[ConstantsAccessibilityRegisterView.phoneNumberTextField]
        XCTAssertTrue(phoneNumberTextField.exists, "El campo debe de existir")
        let string = "189213"
        phoneNumberTextField.tap()
        phoneNumberTextField.typeText("189213")
        XCTAssertEqual(phoneNumberTextField.value as! String, string, "El texto no es el correcto ")
    }
    
    func testNameTextField() {
        let nameTextField = app.textFields[ConstantsAccessibilityRegisterView.nameTextField]
        XCTAssertTrue(nameTextField.exists, "El campo debe de existir")
        let string = "Alex"
        nameTextField.tap()
        nameTextField.typeText(string)
        XCTAssertEqual(nameTextField.value as! String, string, "El texto no es el correcto")
    }
    
    func testPasswordTextField() {
        let passwordTextField = app.textFields[ConstantsAccessibilityRegisterView.passwordTextField]
        XCTAssertTrue(passwordTextField.exists, "El campo debe de existir")
        let string = "Alex-20210212"
        passwordTextField.tap()
        passwordTextField.typeText("Alex-20210212")
        XCTAssertEqual(passwordTextField.value as! String, string, "El texto no es el correcto")
    }
    
    func testRepeatPasswordTextField() {
        let repeatPasswordTextField = app.textFields[ConstantsAccessibilityRegisterView.repeatPasswordTextField]
        XCTAssertTrue(repeatPasswordTextField.exists, "El campo debe de existir")
        let string = "Alex-20210212"
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText(string)
        XCTAssertEqual(repeatPasswordTextField.value as! String, string, "El texto no es el correcto")
    }
}

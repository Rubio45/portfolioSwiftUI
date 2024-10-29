//
//  UITestDEMOAPPUITestsLaunchTests.swift
//  UITestDEMOAPPUITests
//
//  Created by Alex Diaz on 26/10/24.
//

import XCTest

final class DemoUITestLoginViewController: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    
    func testTitle() {
        let staticTitleLabel = app.staticTexts[ConstantsAccessibilityLoginView.titleLabel]
        XCTAssertTrue(staticTitleLabel.exists, "Title label is not present")
        XCTAssertEqual(staticTitleLabel.label, "Login", "Title label is not correct")
    }
    
    func testEmailTextFields() {
        let emailTextField = app.textFields[ConstantsAccessibilityLoginView.usernameTextField]
        XCTAssertTrue(emailTextField.exists, "Email text field is not empty")

        emailTextField.tap()
        let text = "Hello"
        emailTextField.typeText(text)
        XCTAssertEqual(emailTextField.value as! String, text, "Email text field is not correct")
    }
    
    func testPasswordTextFields() {
        let passwordTextField = app.textFields[ConstantsAccessibilityLoginView.passwordTextField]
        XCTAssertTrue(passwordTextField.exists, "Password text field must exist")
        
        let password: String = "pass"
        passwordTextField.tap()
        passwordTextField.typeText(password)
        XCTAssertEqual(passwordTextField.value as! String, password, "Password field is not correct")
    }
    
    func testLoginButton() {
        let loginButton = app.buttons[ConstantsAccessibilityLoginView.loginButton]
        XCTAssertTrue(loginButton.exists, "Login Button must exist")
    }
    
    func testRegisterButton() {
        let registerButton = app.buttons[ConstantsAccessibilityLoginView.registerButton]
        XCTAssertTrue(registerButton.exists, "Register Button must exist")
    }
}

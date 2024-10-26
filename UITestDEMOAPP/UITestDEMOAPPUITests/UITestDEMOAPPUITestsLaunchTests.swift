//
//  UITestDEMOAPPUITestsLaunchTests.swift
//  UITestDEMOAPPUITests
//
//  Created by Alex Diaz on 26/10/24.
//

import XCTest

final class UITestDEMOAPPUITestsLaunchTests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    
    func testTitle() throws {
        let staticTitleLabel = app.staticTexts[ConstantsAccessibilityLoginView.titleLabel]
        XCTAssertTrue(staticTitleLabel.exists, "Title label is not present")
        XCTAssertEqual(staticTitleLabel.label, "Login", "Title label is not correct")
    }
    
    func testEmailTextFields() throws {
        let emailTextField = app.textFields[ConstantsAccessibilityLoginView.usernameTextField]
        XCTAssertTrue(emailTextField.exists, "Email text field is not empty")
        emailTextField.tap()
        emailTextField.typeText("alex@bitmart.com")
        XCTAssertEqual(emailTextField.value as! String, "alex@bitmart.com", "Email text field is not correct")
    }
    
    func testPasswordTextFields() throws {
        let passwordTextField = app.secureTextFields[ConstantsAccessibilityLoginView.passwordTextField]
        XCTAssertTrue(passwordTextField.exists, "Password text field must exist")
        
        passwordTextField.tap()
        passwordTextField.typeText("HelloWorld")
        XCTAssertEqual(passwordTextField.value as! String, "HelloWorld", "Password field is not correct")
    }
}

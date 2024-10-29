//
//  DemoUITestMainViewControllerTests.swift
//  UITestDEMOAPPUITests
//
//  Created by Alex Diaz on 28/10/24.
//

import XCTest
@testable import UITestDEMOAPP

class DemoUITestMainViewControllerTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
        let initialButton = app.buttons[ConstantsAccessibilityLoginView.loginButton]
        initialButton.tap()
    }
    
    func testTitleLabel() {
        let titleLabel = app.staticTexts[ConstantsAccessibilityMainView.titleLabel]
        XCTAssertTrue(titleLabel.exists, "El titulo debe existir")
    }
    
    func testImageView() {
        let imageView = app.images[ConstantsAccessibilityMainView.imageView]
        XCTAssertTrue(imageView.exists, "La imagen del usuario debe existir")
    }
    
    func testTableView() {
        let tableView = app.tables[ConstantsAccessibilityMainView.tableView]
        XCTAssertTrue(tableView.exists, "El TableView debe existir")
    }
    
    func testFirstAndLastTableViewCells() {
        let tableView = app.tables[ConstantsAccessibilityMainView.tableView]
        let firstCell = tableView.cells.element(boundBy: 0)
        XCTAssertTrue(cells.exists, "La primera celda del TableView debe de existir.")
        tableView.swipeUp()
        let lastCell = tableView.cells.element(boundBy: 19)
        
    }
    
}

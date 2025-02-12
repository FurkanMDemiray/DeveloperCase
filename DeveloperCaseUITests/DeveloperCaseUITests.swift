//
//  DeveloperCaseUITests.swift
//  DeveloperCaseUITests
//
//  Created by Melik Demiray on 11.02.2025.
//

import XCTest

final class DeveloperCaseUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it's important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) { // Measure the launch time of the app.
                XCUIApplication().launch()
            }
        }
    }

    func testMainScreenElements() throws {
        // Test navigation title
        XCTAssertTrue(app.navigationBars["Users"].exists)
        
        // Test table view exists
        let tableView = app.tables.firstMatch
        XCTAssertTrue(tableView.exists)
        
        // Wait for cells to load (assuming network call)
        let cell = tableView.cells.firstMatch
        XCTAssertTrue(cell.waitForExistence(timeout: 5))
        
        // Test cell elements
        XCTAssertTrue(cell.staticTexts.element(matching: NSPredicate(format: "label CONTAINS 'Name:'")).exists)
        XCTAssertTrue(cell.staticTexts.element(matching: NSPredicate(format: "label CONTAINS 'E-Mail:'")).exists)
    }
    
    func testNavigationToDetail() throws {
        let tableView = app.tables.firstMatch
        let firstCell = tableView.cells.firstMatch
        
        // Wait for cells to load
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5))
        
        // Tap first cell
        firstCell.tap()
        
        // Verify navigation to detail screen
        XCTAssertTrue(app.navigationBars["User Detail"].exists)
        
        // Test detail screen elements
        let detailElements = [
            "Username:",
            "E-Mail:",
            "Phone:",
            "Website:",
            "Company Name:",
            "Catch Phrase:",
            "City:"
        ]
        
        for element in detailElements {
            XCTAssertTrue(app.staticTexts.element(matching: NSPredicate(format: "label CONTAINS %@", element)).exists)
        }
        
        // Verify map view exists
        XCTAssertTrue(app.maps.firstMatch.exists)
    }
    
    func testBackNavigation() throws {
        let tableView = app.tables.firstMatch
        let firstCell = tableView.cells.firstMatch
        
        // Wait and tap first cell
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5))
        firstCell.tap()
        
        // Verify we're on detail screen
        XCTAssertTrue(app.navigationBars["User Detail"].exists)
        
        // Tap back button
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        // Verify we're back on main screen
        XCTAssertTrue(app.navigationBars["Users"].exists)
    }
    
    func testTableViewScrolling() throws {
        let tableView = app.tables.firstMatch
        
        // Wait for content to load
        XCTAssertTrue(tableView.cells.firstMatch.waitForExistence(timeout: 5))
        
        // Get initial position of first cell
        let firstCell = tableView.cells.firstMatch
        let initialPosition = firstCell.frame.minY
        
        // Scroll down
        tableView.swipeUp()
        
        // Verify position has changed
        XCTAssertNotEqual(firstCell.frame.minY, initialPosition)
        
        // Scroll back up
        tableView.swipeDown()
        
        // Verify we can see the first cell again
        XCTAssertTrue(tableView.cells.firstMatch.isHittable)
    }
}

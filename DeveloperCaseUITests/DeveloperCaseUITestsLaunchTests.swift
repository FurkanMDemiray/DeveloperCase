//
//  DeveloperCaseUITestsLaunchTests.swift
//  DeveloperCaseUITests
//
//  Created by Melik Demiray on 11.02.2025.
//

import XCTest

final class DeveloperCaseUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Verify initial screen loads
        XCTAssertTrue(app.navigationBars["Users"].waitForExistence(timeout: 2))
        
        // Take launch screen screenshot
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

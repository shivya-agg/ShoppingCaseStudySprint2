//
//  LoginViewUITesting.swift
//  CaseStudySprint2UITests
//
//  Created by Capgemini-DA226 on 9/26/22.
//

import XCTest

class LoginViewUITesting: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //MARK: Login title checking if it exists or not
       // XCTAssert(app.staticTexts["Login"].exists)
        
        //MARK: Login title check
       // XCTAssertEqual(app.navigationBars.staticTexts["Login"].exists, true)
       // let navTitle = app.navigationBars.staticTexts["Login"]
       // print(navTitle)
        
        
        let emailIdTextField = app.textFields["Email id"]
        emailIdTextField.tap()
        app.textFields["Email id"].typeText("mike.wheelers@gmail.com")
        print(app.textFields["Email id"].value!)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("Shiv@123")
        
        app.buttons["LOGIN"].tap()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

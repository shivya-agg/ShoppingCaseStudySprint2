//
//  LoginViewTesting.swift
//  CaseStudySprint2Tests
//
//  Created by Capgemini-DA226 on 9/26/22.
//

import XCTest
@testable import CaseStudySprint2

class LoginViewTesting: XCTestCase {

    var loginVC: LoginViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //MARK: Loading login view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        loginVC.loadViewIfNeeded()
    }
    
    //MARK: Functions
    //MARK: Outlet and action Validation
    func testOutletCheck() throws {
        
        XCTAssertNotNil(loginVC.loginEmailTextField, "Failed - No outlet connection with email id text field")
        XCTAssertNotNil(loginVC.loginPasswordTextField, "Failed - No outlet connection with password text field")
        
        //login button outlet, action, title testing
        let loginBtn: UIButton = try XCTUnwrap(loginVC.loginButton, "Failed - No outlet connected to button")
        let loginBtnAction = try XCTUnwrap(loginBtn.actions(forTarget: loginVC, forControlEvent: .touchUpInside), "Login button is not assigned any action")
        XCTAssertEqual(loginBtnAction.first, "loginButtonClicked:", "No such action assigned to login button")
        
    }
    
    //MARK: Textfield Placeholder validation
    //checks if placeholder is empty or not
    func testPlaceholderTextfield() throws {
        XCTAssertEqual(loginVC.loginEmailTextField.placeholder?.isEmpty, false, "Email Placeholder text field is empty")
        XCTAssertEqual(loginVC.loginPasswordTextField.placeholder?.isEmpty, false, "Password Placeholder textfield is empty")
    }

    //MARK: Textfields text validation
    func testTextEnteredValidation() throws {
        XCTAssertTrue(loginVC.emailValidation(emailid: "mike.wheelers@gmail.com"), "Email id not valid")
        XCTAssertTrue(loginVC.passwordValidation(password: "Mike@876"),"Password not valid should be minimum 6 characters, alphanumeric including special character")
        XCTAssertTrue(loginVC.emailExists(emailId: "mike.wheelers@gmail.com"), "Email does not exist in the database")
        XCTAssertTrue(loginVC.emailExistPasswordCheck(password: "Mike@876"),"Password does not match with the database")
        
    }
    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  SignupViewTesting.swift
//  CaseStudySprint2Tests
//
//  Created by Capgemini-DA226 on 9/26/22.
//

import XCTest
@testable import CaseStudySprint2

class SignupViewTesting: XCTestCase {

    var signupVC: SignUpViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        signupVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        signupVC.loadViewIfNeeded()
    }
    //MARK: Testing functions
    //MARK: Outlets and Actions checking
    func testOutletConnection() throws {
        
        XCTAssertNotNil(signupVC.signupNameTextField, "Failed - No outlet connection with name text field")
        XCTAssertNotNil(signupVC.signupEmailIdTextField, "Failed - No outlet connection with email id text field")
        XCTAssertNotNil(signupVC.signupMobileTextField, "Failed - No outlet connection with mobile text field")
        XCTAssertNotNil(signupVC.signupPasswordTextField, "Failed - No outlet connection with password text field")
        XCTAssertNotNil(signupVC.confirmPasswordTextField, "Failed - No outlet connection with confirm text field")
        
        //signup button outlet, action, title testing
        let signupBtn: UIButton = try XCTUnwrap(signupVC.signupButton, "Failed - No outlet connected to button")
        let signupBtnAction = try XCTUnwrap(signupBtn.actions(forTarget: signupVC, forControlEvent: .touchUpInside), "Sign up button is not assigned any action")
        XCTAssertEqual(signupBtnAction.first, "signupButtonClicked:", "No such action assigned to login button")
        
    }
    
    //MARK: Placeholder textfield testing
    func testPlaceholderValidation() throws {
        
        XCTAssertEqual(signupVC.signupNameTextField.placeholder?.isEmpty, false, "Name placeholder text field is empty")
        XCTAssertEqual(signupVC.signupEmailIdTextField.placeholder?.isEmpty, false, "Email Placeholder textfield is empty")
        XCTAssertEqual(signupVC.signupMobileTextField.placeholder?.isEmpty, false, "Mobile text field is empty")
        XCTAssertEqual(signupVC.signupPasswordTextField.placeholder?.isEmpty, false,"Password text field is empty")
        XCTAssertEqual(signupVC.confirmPasswordTextField.placeholder?.isEmpty, false, "Confirm password text field is empty")
        
        
    }
    
    //MARK: Text testing
    func testTextValidation() throws {
        
        XCTAssertTrue(signupVC.passwordValidation(password: "Shiv@123"),"Password not valid should be minimum 6 characters, alphanumeric including special character")
        XCTAssertTrue(signupVC.nameValidation(username: "Shivya"), "Name not valid minimum 4 characters required")
        XCTAssertTrue(signupVC.mobileValidation(mobile: "9876543210"), "Mobile number not valid it has to 10 digits")
        XCTAssertTrue(signupVC.confirmPasswordValidation(password: "Shiv@123", confirmPass: "Shiv@123"))
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

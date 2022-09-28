//
//  AddToCartViewTesting.swift
//  CaseStudySprint2Tests
//
//  Created by Capgemini-DA226 on 9/27/22.
//

import XCTest
import Alamofire
@testable import CaseStudySprint2

class AddToCartViewTesting: XCTestCase {
    
    //MARK: Variables
    var addtoCartVC: AddToCartTableViewController!
    
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
         
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAlamofire() throws {
        let e = expectation(description: "Alamofire")
        Alamofire.request("https://dummyjson.com/products/category/groceries")
            .response {response in
                XCTAssertNil(response.error, "Whoops, error \(response.error!.localizedDescription)")
                XCTAssertEqual(response.response?.statusCode ?? 0, 200, "Status code not 200")
                e.fulfill()
            }
        waitForExpectations(timeout: 5.0, handler: nil)
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

//
//  CoreDataTesting.swift
//  CaseStudySprint2Tests
//
//  Created by Capgemini-DA226 on 9/26/22.
//

import XCTest
@testable import CaseStudySprint2

class CoreDataTesting: XCTestCase {

    //creating instance of database class
    var DBManager = DBOperationsManager()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    //MARK: Functions
    //MARK: Data Insertion into the database testing
    func testDataInsertion() throws {
        //user data insertion
        XCTAssert(DBManager.insertUserData(name: "LeeMinHo", emailId: "leeminho123@gmail.com", mobile: "9876543210", password:"Lee@1234"),"Data insertion failed")
        //product data insertion
        XCTAssertTrue(DBManager.insertProductData(name: "IphoneX", detail: "IphoneX with the good quality camera"))
        
    }
    
    //MARK: Data fetching from the database testing
    func testDataFetching() throws {
        XCTAssertNotNil(DBManager.fetchUserRecord(), "Error a nil value found in the database")
        XCTAssertNotNil(DBManager.fetchProductRecord(), "Error a nil value found in the database")
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

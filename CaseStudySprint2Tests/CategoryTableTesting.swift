//
//  CategoryTableTesting.swift
//  CaseStudySprint2Tests
//
//  Created by Capgemini-DA226 on 9/27/22.
//

import XCTest
@testable import CaseStudySprint2

class CategoryTableTesting: XCTestCase {

    var categoryTableVC: CategoryTableViewController!
    
    //MARK: Testing Functions
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        categoryTableVC = storyboard.instantiateViewController(withIdentifier: "categoryTableViewController") as? CategoryTableViewController
        categoryTableVC.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //MARK: TableView Testing
    func test_HasTableView() throws {
        XCTAssertNotNil(categoryTableVC.tableView, "Failed - No table view present")
        XCTAssertNotNil(categoryTableVC.tableView.delegate, "Failed - No delegate present")
        XCTAssertNotNil(categoryTableVC.tableView.dataSource, "Failed - No data source present")
        
    }
    
    //MARK: TableView conforms to protocols testing
    func test_tableViewHasDelegateMethods() throws {
        //MARK: TableViewDelegate conformance testing
        XCTAssertTrue(categoryTableVC.conforms(to:UITableViewDelegate.self), "Failed - tableView delgate not present")
        XCTAssertTrue(categoryTableVC.responds(to: #selector(categoryTableVC.tableView(_:didSelectRowAt:))),"Failed tableview does not conform to tableview delegate protocol")
        
            //MARK: UITableViewDataSource conformance testing
        XCTAssertTrue(categoryTableVC.conforms(to: UITableViewDataSource.self), "Failed - No such protocol")
        XCTAssertTrue(categoryTableVC.responds(to: #selector(categoryTableVC.numberOfSections(in:))), "Failed - number of rows in section function not included")
        XCTAssertTrue(categoryTableVC.responds(to: #selector(categoryTableVC.tableView(_:numberOfRowsInSection:))), "Failed - number of rows in section function not included")
        XCTAssertTrue(categoryTableVC.responds(to: #selector(categoryTableVC.tableView(_:cellForRowAt:))), "Failed - cell for row at function not included")
        
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

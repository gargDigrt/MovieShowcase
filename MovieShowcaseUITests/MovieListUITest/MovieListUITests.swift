//
//  MovieListUITests.swift
//  MovieShowcaseUITests
//
//  Created by Vivek on 26/04/21.
//

import XCTest

class MovieListUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// This will test if MovieList table view is visible
    func testMovieListTableIsVisible() {
        app.launch()
        
        //Assert that we are displaying the contact table view
        let movieListTableView = app.tables["table--movieListTableView"]
        
        XCTAssertTrue(movieListTableView.exists, "The movie list table view exist.")
        
    }

}

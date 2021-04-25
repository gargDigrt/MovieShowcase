//
//  MovieDataSourceTest.swift
//  MovieShowcaseTests
//
//  Created by Vivek on 26/04/21.
//

import XCTest
@testable import MovieShowcase

class MovieDataSourceTest: XCTestCase {

    //This will test for data for the datasource
    func testMovieDataSourceExists() {
        
        let dataSource = MovieListDataSource()
        XCTAssertNotNil(dataSource.data)
    }

}

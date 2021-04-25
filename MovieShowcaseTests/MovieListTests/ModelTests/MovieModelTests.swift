//
//  MovieModelTests.swift
//  MovieShowcaseTests
//
//  Created by Vivek on 26/04/21.
//

import XCTest
@testable import MovieShowcase

class MovieModelTests: XCTestCase {

    /// This will test MovieModel custom object initializer
    func testMovieModelExist() {
        
        let newMovie = Movie(name: "GodZila", id: 1212, overview: "General Overview", posterPath: "/jKTdzMjfSXqlxj9vkHqG4wVj3BS.jpg", releaseDate: "12-04-2020", title: "One gonna down")
        
        XCTAssertNotNil(newMovie)
    }

}

//
//  MovieInfoViewModelTests.swift
//  MovieShowcaseTests
//
//  Created by Vivek on 25/04/21.
//

import XCTest
@testable import MovieShowcase

class MovieInfoViewModelTests: XCTestCase {

    /// This will test MovieInfoViewModel custom object initializer
    func testMovieInfoViewModelExist() {
        
        let newMovie = Movie(name: "GodZila", id: 1212, overview: "General Overview", posterPath: "/jKTdzMjfSXqlxj9vkHqG4wVj3BS.jpg", releaseDate: "12-04-2020", title: "One gonna down")
        let movieInfoVM = MovieInfoViewModel(movie: newMovie)
        
        XCTAssertNotNil(movieInfoVM)
    }

}

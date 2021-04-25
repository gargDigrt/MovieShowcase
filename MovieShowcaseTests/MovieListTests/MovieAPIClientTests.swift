//
//  MovieAPIClientTests.swift
//  MovieShowcaseTests
//
//  Created by Vivek on 26/04/21.
//

import XCTest
@testable import MovieShowcase

class MovieAPIClientTests: XCTestCase {

    /// This will test Asynchronous call to get contact list data
    /// - Throws: It throws XCTFail exception
    func testGetContactListCall() throws {
        let apiClient = WebServices()
        
        // Create expectation
        let expectation = self.expectation(description: "Movie API Client completed async task and call success completion.")
        
        //Setup the URLRequest resource
        let urlText = MovieRequest.nowPlaying.getEndPoint()
        let param:[String: String] = ["api_key": AppConfig.apiKey,
                                      "language": "en-US",
                                      "page": "1"]
        let resource = Resource<NowPlaying>(urlText,param)
        
        // Execute the function that need to be tested
        apiClient.load(resource: resource){ result in
            
            //Assert the data
            XCTAssertNotNil(result)
            
            switch result{
            case .success(let _):
            // If data is not nil than expectation meets
            expectation.fulfill()
            
            case .failure(let error):
            // If data is nil and there is an error
            XCTAssertNil(error)
            }
           
            
        }
        
        // Wait for the expectation to be fulfilled
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                XCTFail("waitForExpectationWithTimeout errored: \(error.localizedDescription)")
            }
            
        }
    }
    
}

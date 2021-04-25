//
//  NowPlaying.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

// Model Class for Now Playing instance
struct NowPlaying: Codable {
    
    //Properties
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

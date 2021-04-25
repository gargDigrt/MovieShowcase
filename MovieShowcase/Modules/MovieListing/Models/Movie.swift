//
//  Movie.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

// Model class for Movie
struct Movie: Codable {
    
    //Properties
    let name: String
    let id : Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case name = "original_title"
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}

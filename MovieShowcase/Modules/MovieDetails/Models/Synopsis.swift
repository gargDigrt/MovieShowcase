//
//  Synopsis.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

// Model class for Synopsis
struct Synopsis: Codable {
    
    //Properties
    let id: Int
    let title: String
    let tagline: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let releaseDate: String
    let runtime: Int
    let genres: [Genre]
    
    
    enum CodingKeys: String, CodingKey {
        case id, title, tagline
        case overview, runtime, genres
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }
}

// Model class for Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

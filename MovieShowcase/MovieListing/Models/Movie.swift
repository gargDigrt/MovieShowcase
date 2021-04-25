//
//  Movie.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

struct Movie: Codable {
    let name: String
    let adult: Bool
    let id : Int
    let originalLanguage: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "original_title"
        case adult
        case id
        case originalLanguage = "original_language"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

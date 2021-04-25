//
//  Reviews.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

struct Reviews: Codable {
    
    let id : Int
    let page : Int
    let authors : [Author]?
    let totalPages : Int
    let totalResults : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case page = "page"
        case authors = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        page = try values.decode(Int.self, forKey: .page)
        authors = try values.decodeIfPresent([Author].self, forKey: .authors)
        totalPages = try values.decode(Int.self, forKey: .totalPages)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
    }
}

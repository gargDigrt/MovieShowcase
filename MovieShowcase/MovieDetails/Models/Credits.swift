//
//  CreditModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct Credits: Codable {
    let id: Int
    let cast: [CastMember]
    let crew: [CrewMember]
    
    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cast = try values.decode([CastMember].self, forKey: .cast)
        crew = try values.decode([CrewMember].self, forKey: .crew)
        id = try values.decode(Int.self, forKey: .id)
    }
    
}

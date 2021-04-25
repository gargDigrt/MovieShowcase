//
//  CastMember.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct CastMember: Codable {
    
    let character : String
    let id : Int
    let name : String
    let profilePath : String?
    
    enum CodingKeys: String, CodingKey {
        case character = "character"
        case id = "id"
        case name = "name"
        case profilePath = "profile_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        character = try values.decode(String.self, forKey: .character)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        profilePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
    }
}

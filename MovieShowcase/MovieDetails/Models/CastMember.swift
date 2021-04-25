//
//  CastMember.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct CastMember: Codable {
    let name: String
    let character: String
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case character
        case profilePath = "profile_path"
    }
}

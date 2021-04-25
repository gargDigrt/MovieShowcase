//
//  CrewMember.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct CrewMember: Codable {
    let name: String
    let department: String
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case department
        case profilePath = "profile_path"
    }
}

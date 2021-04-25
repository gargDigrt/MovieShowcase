//
//  AuthorDetail.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

// Model class for AuthorDetail
struct AuthorDetail : Codable {
    
    //Properties
    let avatarPath : String?
    let name : String?
    let rating : Int?
    let username : String?
    
    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
        case name = "name"
        case rating = "rating"
        case username = "username"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avatarPath = try values.decodeIfPresent(String.self, forKey: .avatarPath)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        username = try values.decodeIfPresent(String.self, forKey: .username)
    }
    
}

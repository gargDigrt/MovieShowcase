//
//  Author.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

struct Author: Codable {
    
    let name : String?
    let authorDetails : AuthorDetail?
    let content : String?
    let createdAt : String?
    let id : String?
    let updatedAt : String?
    let url : String?
    
    enum CodingKeys: String, CodingKey {
        case name = "author"
        case authorDetails = "author_details"
        case content = "content"
        case createdAt = "created_at"
        case id = "id"
        case updatedAt = "updated_at"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        authorDetails = try values.decodeIfPresent(AuthorDetail.self, forKey: .authorDetails)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
    
}

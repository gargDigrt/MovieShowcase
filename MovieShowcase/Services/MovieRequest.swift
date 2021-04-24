//
//  MovieRequest.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

enum MovieRequest {
    
    case nowPlaying
    case detail(movieID: Int)
    case reviews(movieID: Int)
    case credits(movieID: Int)
    case similar(movieID: Int)
    
    func getEndPoint() -> String {
        var nextString = ""
        switch self {
        case .nowPlaying:
            nextString = "/movie/now_playing"
        case .detail(let id):
            nextString = "/movie/\(id)"
        case .reviews(let id):
            nextString = "/movie/\(id)/reviews"
        case .credits(let id):
            nextString = "/movie/\(id)/credits"
        case .similar(let id):
            nextString = "/movie/\(id)/similar"
        }
        
        let finalUrlString = AppConfig.apiBaseURL + nextString
        return finalUrlString
    }
    
}

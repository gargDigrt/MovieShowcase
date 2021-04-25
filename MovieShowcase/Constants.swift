//
//  Constants.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

enum AppConfig {
    
    static let apiBaseURL = "https://api.themoviedb.org/3"
    static let imageBasePath = "http://image.tmdb.org/t/p/"
    static let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
}

enum Storyboard: String {
    case main
    
    func name() -> String {return rawValue.capitalized}
}

enum ImageSize: String {
    case original
    case w45
    case w92
    case w154
    case w185
    case w300
    case w342
    case w500
    case w1280
    case h632
}

let DEFAULT_PARAMS:[String: String] = ["api_key": AppConfig.apiKey,
                                                   "language": "en-US"]

//
//  Constants.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

enum AppConfig {
    
    static let apiBaseURL = "https://api.themoviedb.org/3"
    static let imageBasePath = "http://image.tmdb.org/t/p/w185"
    static let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
}

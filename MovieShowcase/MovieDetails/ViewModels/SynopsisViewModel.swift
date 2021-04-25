//
//  SynopsisViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

struct SynopsisViewModel {
    private let synopsis: Synopsis
    
    init(synopsis: Synopsis) {
        self.synopsis = synopsis
    }
}


extension SynopsisViewModel {
    
    var title: String {
        return self.synopsis.title
    }
    
    var tagline: String {
        return self.synopsis.tagline
    }
    
    var overview: String{
        return self.synopsis.overview
    }
    
    var posterPath: String {
        return self.synopsis.posterPath
    }
    var releaseDate: String {
        return self.synopsis.releaseDate
    }
    var runtime: Int {
        return self.synopsis.runtime
    }
    
    var genres: [String] {
        return self.synopsis.genres.map{$0.name}
    }
    
}

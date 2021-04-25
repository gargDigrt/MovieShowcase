//
//  MovieInfoViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

struct MovieInfoViewModel {
    private let movie: Movie
   
   init(movie: Movie) {
       self.movie = movie
   }
}

extension MovieInfoViewModel {
    
    var Id: Int {
        return self.movie.id
    }
    var name: String {
        return self.movie.name
    }
    
    var releaseDate: String {
        return self.movie.releaseDate
    }
    var overview: String {
        return self.movie.overview
    }
    var posterPath: String {
        return self.movie.posterPath
    }
}

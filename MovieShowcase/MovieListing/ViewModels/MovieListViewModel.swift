//
//  MovieListViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

struct MovieListViewModel {
    
    //Properties
    private let movies: [Movie]
    
    //Initializer
    init(movies: [Movie]) {
        self.movies = movies
    }
}

//MARK:- Table view list properties

extension MovieListViewModel {
    var numberOfMovies: Int {
        return self.movies.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieInfoViewModel {
        let movie = movies[index]
        let movieViewModel = MovieInfoViewModel(movie: movie)
        return movieViewModel
    }
}

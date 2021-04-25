//
//  MovieListViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

struct MovieListViewModel {
    
    //Properties
    private let nowPlaying: NowPlaying
    private var movies: [Movie] {
        get {
            return nowPlaying.movies
        }
    }
    
    //Initializer
    init(nowPlaying: NowPlaying) {
        self.nowPlaying = nowPlaying
    }
}

//MARK:- Table view list properties
extension MovieListViewModel {
    var pageIndex: String {
        return String(self.nowPlaying.page)
    }
    
    
    /// This will return ViewModel for a movie at particular index
    /// - Parameter index: Index of the movie
    /// - Returns: MovieInfoViewModel
    func movieAtIndex(_ index: Int) -> MovieInfoViewModel {
        let movie = movies[index]
        let movieViewModel = MovieInfoViewModel(movie: movie)
        return movieViewModel
    }
}

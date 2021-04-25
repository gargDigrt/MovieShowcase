//
//  MovieListDataSource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


/// MovieListTableView DataSource
class MovieListDataSource: GenericDataSource<Movie>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieInfoCell = tableView.dequeueReusableCell(withIdentifier: MovieInfoViewCell.identifier, for: indexPath) as? MovieInfoViewCell else {
            fatalError("Couldn't create the movie info cell!!")
        }
        let movie = self.data[indexPath.row]
        movieInfoCell.movieViewModel = MovieInfoViewModel(movie: movie)
        return movieInfoCell
    }
    
}

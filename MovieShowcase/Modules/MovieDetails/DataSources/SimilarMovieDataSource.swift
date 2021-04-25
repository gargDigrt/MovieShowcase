//
//  MovieDataSource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


/// UICollectionDataSource for SimilarCollectionCollectionView
class SimilarMovieDataSource: GenericDataSource<Movie>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: SimilarMovieViewCell.identifier, for: indexPath) as? SimilarMovieViewCell else {
            fatalError("Couldn't generate the Cast info cell for Cast Model!!")
        }
        let movie = self.data[indexPath.row]
        movieCell.movieVM = MovieInfoViewModel(movie: movie)
        return movieCell
    }
}

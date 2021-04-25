//
//  SimilarMovieViewCell.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

class SimilarMovieViewCell: UICollectionViewCell {
    
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var containerView: UIView! {
        didSet {
            containerView.addShadow()
        }
    }
    
    //Cell Identifier
    static var identifier: String {
        get{String(describing: self)}
    }
    
    //ViewModel
    var movieVM: MovieInfoViewModel! {
        didSet {
            movieNameLabel.text = movieVM.name
            moviePosterImageView.setImage(endPoint: movieVM.posterPath, size: .w300, placeholderImage: #imageLiteral(resourceName: "movie_placeholder"))
        }
    }
}

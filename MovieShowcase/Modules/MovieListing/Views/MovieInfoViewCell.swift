//
//  MovieInfoViewCell.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import UIKit

class MovieInfoViewCell: UITableViewCell {
    
    //@IBOutlet
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var otherDetailsLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var containerView: UIView! {
        didSet {
            containerView.addShadow()
        }
    }
    
    //Variables
    static var identifier: String {return String(describing: self)}
    var movieViewModel: MovieInfoViewModel! {
        didSet {
            movieNameLabel.text = movieViewModel.name
            releaseDateLabel.text = movieViewModel.releaseDate
            otherDetailsLabel.text = movieViewModel.overview
            moviePosterImageView.setImage(endPoint: movieViewModel.posterPath, size: .w300)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        moviePosterImageView.image = nil
    }
    
}

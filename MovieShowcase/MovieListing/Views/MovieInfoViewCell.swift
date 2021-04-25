//
//  MovieInfoViewCell.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import UIKit

class MovieInfoViewCell: UITableViewCell {
    
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var otherDetailsLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    
    static var identifier: String {return String(describing: self)}
    var movieViewModel: MovieInfoViewModel! {
        didSet {
            movieNameLabel.text = movieViewModel.name
            releaseDateLabel.text = movieViewModel.releaseDate
            otherDetailsLabel.text = movieViewModel.overview
            moviePosterImageView.setImage(endPoint: movieViewModel.posterPath, size: .w300)
        }
    }

    @IBOutlet var containerView: UIView! {
        didSet {
            containerView.addShadow()
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func bookButtonTapped(_ : UIButton) {
        
    }
    
}

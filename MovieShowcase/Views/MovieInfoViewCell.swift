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
    
    var movieViewModel: MovieInfoViewModel! {
        didSet {
            movieNameLabel.text = movieViewModel.name
            releaseDateLabel.text = movieViewModel.releaseDate
            otherDetailsLabel.text = movieViewModel.overview
        }
    }

    @IBOutlet var containerView: UIView! {
        didSet {
            // Make it card-like
            containerView.layer.cornerRadius = 10
            containerView.layer.shadowOpacity = 1
            containerView.layer.shadowRadius = 4
            containerView.layer.shadowColor = UIColor.darkGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
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

//
//  ReviewInfoViewCell.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

class ReviewInfoViewCell: UICollectionViewCell {
    
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var authorNameLabel: UILabel!
    @IBOutlet var authorReviewLabel: UILabel!
    
    static var identifier: String {
        get{String(describing: self)}
    }
    
    //ViewModel
    var authorVM: AuthorViewModel! {
        didSet {
            authorNameLabel.text = authorVM.name
            authorReviewLabel.text = authorVM.review
            authorImageView.setImage(endPoint: authorVM.avtarPath, size: .w92, placeholderImage: #imageLiteral(resourceName: "user_placeholder"))
        }
    }
    
}

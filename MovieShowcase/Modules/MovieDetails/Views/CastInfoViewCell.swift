//
//  CastInfoViewCell.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

class CastInfoViewCell: UICollectionViewCell {
    
    //IBOutlet
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var roleLabel: UILabel!
    
    //Cell Identifier
    static var identifier: String {
        get{String(describing: self)}
    }
    
    //ViewModel
    var castMemberVM: CastMemberViewModel! {
        didSet {
            nameLabel.text = castMemberVM.name
            roleLabel.text = "as \(castMemberVM.character)"
            profileImageView.setImage(endPoint: castMemberVM.profilePath, size: .w92, placeholderImage: #imageLiteral(resourceName: "user_placeholder"))
        }
    }
}

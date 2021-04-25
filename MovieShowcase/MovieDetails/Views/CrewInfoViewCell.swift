//
//  CreditInfoViewCell.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import UIKit

class CrewInfoViewCell: UICollectionViewCell {
    
    //IBOutlet
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    
    static var identifier: String {
        get{String(describing: self)}
    }
    
    //ViewModel
    var crewMemberVM: CrewMemberViewModel! {
        didSet {
            nameLabel.text = crewMemberVM.name
            departmentLabel.text = crewMemberVM.department
            profileImageView.setImage(endPoint: crewMemberVM.profilePath, size: .w92, placeholderImage: #imageLiteral(resourceName: "user_placeholder"))
        }
    }
     
}

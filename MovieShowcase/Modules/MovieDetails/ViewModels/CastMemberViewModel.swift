//
//  CastMemberViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

// ViewModel class for CastMember
struct CastMemberViewModel {
    //Private properties
    private let castMember: CastMember
    
    //Initializer
    init(member: CastMember) {
        self.castMember = member
    }
}

//MARK:- Properties
extension CastMemberViewModel {
    
    var name: String {
        return self.castMember.name
    }
    
    var character: String {
        return self.castMember.character
    }
    
    var profilePath: String {
        return self.castMember.profilePath ?? ""
    }
}

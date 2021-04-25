//
//  CastMemberViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

struct CastMemberViewModel {
    
    private let castMember: CastMember
    
    init(member: CastMember) {
        self.castMember = member
    }
}

extension CastMemberViewModel {
    
    var name: String {
        return self.castMember.name
    }
    
    var character: String {
        return self.castMember.character
    }
    
    var profilePath: String {
        return self.castMember.profilePath
    }
}

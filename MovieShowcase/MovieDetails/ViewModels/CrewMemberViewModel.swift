//
//  CrewMemberViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct CrewMemberViewModel {
    
    private let crewMember: CrewMember
    
    init(member: CrewMember) {
        self.crewMember = member
    }
}

extension CrewMemberViewModel {
    
    var name: String {
        return self.crewMember.name
    }
    
    var department: String {
        return self.crewMember.department
    }
    
    var profilePath: String {
        return self.crewMember.profilePath ?? ""
    }
}

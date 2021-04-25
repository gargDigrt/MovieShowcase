//
//  CrewMemberViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct CrewMemberViewModel {
    
    //Private properties
    private let crewMember: CrewMember
    
    //Initializer
    init(member: CrewMember) {
        self.crewMember = member
    }
    
}

extension CrewMemberViewModel {
    
    //Properties
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

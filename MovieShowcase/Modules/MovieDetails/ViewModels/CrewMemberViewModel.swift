//
//  CrewMemberViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

// ViewModel class for CrewMember
struct CrewMemberViewModel {
    
    //Private properties
    private let crewMember: CrewMember
    
    //Initializer
    init(member: CrewMember) {
        self.crewMember = member
    }
    
}

//MARK:- Properties
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

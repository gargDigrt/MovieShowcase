//
//  CreditsViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

// ViewModel class for Credits
struct CreditsViewModel {
    //Private properties
    private let credits: Credits
    
    //Initializer
    init(credits: Credits) {
        self.credits = credits
    }
}

//Mark:- Properties
extension CreditsViewModel {
    
    var crewMembers: [CrewMemberViewModel] {
        return self.credits.crew.map{CrewMemberViewModel(member: $0)}
    }
    
    var castMembers: [CastMemberViewModel] {
        return self.credits.cast.map{CastMemberViewModel(member: $0)}
    }
}

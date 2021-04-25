//
//  CreditsViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct CreditsViewModel {
    private let credits: Credits
    
    init(credits: Credits) {
        self.credits = credits
    }
}

extension CreditsViewModel {
    
    var crewMembers: [CrewMemberViewModel] {
        return self.credits.crew.map{CrewMemberViewModel(member: $0)}
    }
    
    var castMembers: [CastMemberViewModel] {
        return self.credits.cast.map{CastMemberViewModel(member: $0)}
    }
}

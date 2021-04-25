//
//  CreditModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


struct Credits: Codable {
    let id: Int
    let cast: [CastMember]
    let crew: [CrewMember]
}

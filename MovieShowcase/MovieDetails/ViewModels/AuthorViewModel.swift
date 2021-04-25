//
//  AuthorViewModel.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

struct AuthorViewModel {
    
    //Private properties
    private let author: Author
    
    //Initializer
    init(author: Author) {
        self.author = author
    }
    
}

extension AuthorViewModel {
    
    //Properties
    var name: String {
        return self.author.name ?? "User"
    }
    
    var avtarPath: String {
        return self.author.authorDetails?.avatarPath ?? ""
    }
    
    var review: String {
        return self.author.content ?? "NA"
    }
}

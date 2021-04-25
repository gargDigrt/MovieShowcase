//
//  Protocols.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation
import UIKit



protocol StoryBoardAble: class {
    static var storyBoard: Storyboard {get}
    static var identifier: String {get}
    
}

extension StoryBoardAble where Self: UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiateFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyBoard.name(), bundle: nil)
        
        guard let expectedVC = storyboard.instantiateViewController(withIdentifier: self.identifier) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(storyBoard.name())")
        }
        return expectedVC
    }
}

//
//  Protocols.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation
import UIKit



/// This protocol will allow ViewController to get instantiated easily
protocol StoryBoardAble: class {
    //Properties
    static var storyBoard: Storyboard {get}
    static var identifier: String {get}
    
}

//MARK:- Functions
extension StoryBoardAble where Self: UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
    /// To instantiate a particular UIViewController
    /// - Returns: UIViewController Instance
    static func instantiateFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyBoard.name(), bundle: nil)
        
        guard let expectedVC = storyboard.instantiateViewController(withIdentifier: self.identifier) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(storyBoard.name())")
        }
        return expectedVC
    }
}

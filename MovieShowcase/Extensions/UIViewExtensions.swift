//
//  UIViewExtensions.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


extension UIView {
    
    func addShadow(_ color: UIColor = .darkGray) {
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
}


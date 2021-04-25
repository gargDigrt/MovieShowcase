//
//  MovieProtocols.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

/// Protocol for Movie selection from MovieList
/// Used For MovieViewController.swift
protocol MovieSelectionDelegate: UIViewController {
    func selectedCell(row: Int)
}

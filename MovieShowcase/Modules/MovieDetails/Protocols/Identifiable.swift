//
//  Identifiable.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


/// This protocol will add identification
/// Only for UICollectionView
protocol Identifiable: UICollectionView {
    var type: CollectionType {get set}
}



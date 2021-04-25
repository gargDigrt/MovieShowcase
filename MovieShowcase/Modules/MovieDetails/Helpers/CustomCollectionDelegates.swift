//
//  CustomCollectionDelegates.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


/// Custom collection delegate
/// Common for all CollectionView
class CustomCollectionDelegates: NSObject, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let collection = collectionView as? CustomCollection  {
            switch collection.type {
            case .cast:
                return CGSize(width: 150, height: 200)
            case .crew:
                return CGSize(width: 150, height: 200)
            case .review:
                return CGSize(width: 225, height: 150)
            case .movie:
                return CGSize(width: 175, height: 300)
            }
        }
        return CGSize(width: 150, height: 200)
    }
}


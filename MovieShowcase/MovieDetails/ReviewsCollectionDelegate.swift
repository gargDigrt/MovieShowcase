//
//  ReviewsCollectionDelegate.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


class ReviewsCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 225, height: 125)
    }
}


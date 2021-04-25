//
//  ReviewDataSource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

/// UICollectionDataSource for ReviewCollectionView
class ReviewDataSource: GenericDataSource<Author>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let authorCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewInfoViewCell.identifier, for: indexPath) as? ReviewInfoViewCell else {
            fatalError("Couldn't generate the Cast info cell for Cast Model!!")
        }
        let member = self.data[indexPath.row]
        authorCell.authorVM = AuthorViewModel(author: member)
        return authorCell
    }
}


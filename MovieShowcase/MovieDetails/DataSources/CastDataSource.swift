//
//  CastDataSource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


class CastDataSource: GenericDataSource<CastMember>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let castCell = collectionView.dequeueReusableCell(withReuseIdentifier: CastInfoViewCell.identifier, for: indexPath) as? CastInfoViewCell else {
            fatalError("Couldn't generate the Cast info cell for Cast Model!!")
        }
        let member = self.data[indexPath.row]
        castCell.castMemberVM = CastMemberViewModel(member: member)
        return castCell
    }
    
    
}

extension CastDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

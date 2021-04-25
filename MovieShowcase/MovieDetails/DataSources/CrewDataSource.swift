//
//  CreditsDataSource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

class GenericDataSource<T>: NSObject {
    var data:[T] = []
}

class CrewDataSource: GenericDataSource<CrewMember>, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let crewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CrewInfoViewCell.identifier, for: indexPath) as? CrewInfoViewCell else {
            fatalError("Couldn't generate the Credit info cell for Crew Model!!")
        }
        let member = self.data[indexPath.row]
        crewCell.crewMemberVM = CrewMemberViewModel(member: member)
        return crewCell
    }
    
    
}


extension CrewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

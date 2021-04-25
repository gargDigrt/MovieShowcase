//
//  CreditsDataSource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

/// UICollectionDataSource for CrewCollectionView
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

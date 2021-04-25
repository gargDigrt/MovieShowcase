//
//  MovieDetailsViewController.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import UIKit

class MovieDetailsViewController: UIViewController, StoryBoardAble {
    
    //IBOutlet
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var castCollectionView: UICollectionView!
    @IBOutlet var crewCollectionView: UICollectionView!
    @IBOutlet var reviewsCollectionView: UICollectionView!
    @IBOutlet var similarMovieCollectionView: UICollectionView!
    
    static var storyBoard: Storyboard {return .main}

    //MARK:- View's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}


//MARK:- UICollectionViewDataSource
extension MovieDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        return collectionView == castCollectionView ? 10 : 0
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier:  "CreditInfoViewCell", for: indexPath) as! CrewInfoViewCell
    }
    
}

extension MovieDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

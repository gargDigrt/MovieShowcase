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
    
    var movieId: Int!
    
    var synopsisVM: SynopsisViewModel! {
        didSet {
            DispatchQueue.main.async {
                self.moviePosterImageView.setImage(endPoint: self.synopsisVM.backdropPath, size: .w500)
                self.overviewLabel.text = self.synopsisVM.overview
                self.title = self.synopsisVM.title
            }
        }
    }

    //MARK:- View's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getMovieDetails()
    }
    
    private func getMovieDetails() {
        
        let urlText = MovieRequest.detail(movieID: movieId).getEndPoint()
        
        let resource = Resource<Synopsis>(urlText)
        
        WaitingLoader.shared.show(onView: view)
        WebServices().load(resource: resource) { result in
            //Hide the waiting loader first
            DispatchQueue.main.async {
                WaitingLoader.shared.hide(fromView: self.view)
            }
            //Check for the result
            switch result {
            case .success(let synopsis):
                print(synopsis)
                self.synopsisVM = SynopsisViewModel(synopsis: synopsis)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


//MARK:- UICollectionViewDataSource
extension MovieDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == crewCollectionView ? 10 : 0
//        return 10
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

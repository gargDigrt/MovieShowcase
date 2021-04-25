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
    
//Datasources
    
    let crewDataSource = CrewDataSource()
    let castDataSource = CastDataSource()
    let reviewDataSource = ReviewDataSource()
    let movieDataSource = MovieDataSource()
    let collectionDelegate = ReviewsCollectionDelegate()
    let similarMovieDelegate = SimilarMovieDelegates()

    //MARK:- View's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getMovieDetails()
        getMovieCredits()
        getMovieReviews()
        getSimilarMovie()
        
        reviewsCollectionView.delegate = collectionDelegate
        similarMovieCollectionView.delegate = similarMovieDelegate
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
                self.synopsisVM = SynopsisViewModel(synopsis: synopsis)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getMovieCredits() {
        
        let urlText = MovieRequest.credits(movieID: movieId).getEndPoint()
        let resource = Resource<Credits>(urlText)
        
        WaitingLoader.shared.show(onView: view)
        WebServices().load(resource: resource) { result in
            //Hide the waiting loader first
            DispatchQueue.main.async {
                WaitingLoader.shared.hide(fromView: self.view)
            }
            //Check for the result
            switch result {
            case .success(let credits):
                self.crewDataSource.data = credits.crew
                self.castDataSource.data = credits.cast
                DispatchQueue.main.async {
                    self.crewCollectionView.dataSource = self.crewDataSource
                    self.castCollectionView.dataSource = self.castDataSource
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getMovieReviews() {
        
        let urlText = MovieRequest.reviews(movieID: movieId).getEndPoint()
        let resource = Resource<Reviews>(urlText)
        
        WaitingLoader.shared.show(onView: view)
        WebServices().load(resource: resource) { result in
            //Hide the waiting loader first
            DispatchQueue.main.async {
                WaitingLoader.shared.hide(fromView: self.view)
            }
            //Check for the result
            switch result {
            case .success(let reviews):
                self.reviewDataSource.data = reviews.authors ?? []
                DispatchQueue.main.async {
                    self.reviewsCollectionView.dataSource = self.reviewDataSource
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getSimilarMovie() {
        
        let urlText = MovieRequest.similar(movieID: movieId).getEndPoint()
        let resource = Resource<SimilarMovies>(urlText)
        
        WaitingLoader.shared.show(onView: view)
        WebServices().load(resource: resource) { result in
            //Hide the waiting loader first
            DispatchQueue.main.async {
                WaitingLoader.shared.hide(fromView: self.view)
            }
            //Check for the result
            switch result {
            case .success(let similarMovies):
                self.movieDataSource.data = similarMovies.movies ?? []
                DispatchQueue.main.async {
                    self.similarMovieCollectionView.dataSource = self.movieDataSource
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


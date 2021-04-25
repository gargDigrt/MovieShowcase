//
//  MoviesViewController.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import UIKit

class MoviesViewController: UIViewController{
    
    //IBOutlates
    @IBOutlet var movieListTableView: UITableView!
    
    //Variables
    private var movieListVm: MovieListViewModel?
    var searchController: UISearchController!
    let movieListDatasource = MovieListDataSource()
    lazy var movieListDelegate = MovieListDelegates(withDelegate: self)
    var pageIndex: String {
        get{
            return movieListVm?.pageIndex ?? "1"
        }
    }
    
    //MARK:- View's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie Showcase"
        
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search your movie"
        
        movieListTableView.delegate = movieListDelegate
        
        getMoviesList()
    }
    
    //MARK:- GEt movies from server
    private func getMoviesList() {
        
        let urlText = MovieRequest.nowPlaying.getEndPoint()
        let param:[String: String] = ["api_key": AppConfig.apiKey,
                                      "language": "en-US",
                                      "page": pageIndex]
        let resource = Resource<NowPlaying>(urlText,param)
        
        WaitingLoader.shared.show(onView: view)
        WebServices().load(resource: resource) { result in
            //Hide the waiting loader first
            DispatchQueue.main.async {
                WaitingLoader.shared.hide(fromView: self.view)
            }
            //Check for the result
            switch result {
            case .success(let nowPlaying):
                self.movieListVm = MovieListViewModel(nowPlaying: nowPlaying)
                self.movieListDatasource.data = nowPlaying.movies
                DispatchQueue.main.async {
                    self.movieListTableView.dataSource = self.movieListDatasource
                    self.movieListTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK:- Movie selection delegate
extension MoviesViewController: MovieSelectionDelegate {
    
    /// This will perform movie selection for list
    /// - Parameter row: Selected row number
    func selectedCell(row: Int) {
        let movieInfoVM = movieListVm?.movieAtIndex(row)
        let movieDetailVC = MovieDetailsViewController.instantiateFromStoryboard()
        guard let movieID = movieInfoVM?.Id else {return}
        movieDetailVC.movieId = movieID
        DispatchQueue.main.async {
            self.navigationController?.show(movieDetailVC, sender: nil)
        }
    }
}

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
    var pageIndex: String {
        get{
            return movieListVm?.pageIndex ?? "1"
        }
    }
    let movieListDatasource = MovieListDataSource()
    lazy var moviListDelegate = MovieListDelegates(withDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie Showcase"
        
        //        searchController = UISearchController(searchResultsController: nil)
        //        navigationItem.hidesSearchBarWhenScrolling = true
        //        navigationItem.searchController = searchController
        //        searchController.obscuresBackgroundDuringPresentation = false
        //        searchController.searchBar.placeholder = "Search a movie"
        //        searchController.searchBar.delegate = self
        
        movieListTableView.delegate = moviListDelegate
        
        // Do any additional setup after loading the view.
        getMoviesList()
    }
    
    
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
    
    
    func searchFor(_ searchText: String?) {
        guard searchController.isActive else { return }
        guard let searchText = searchText else {
            //        resultsTableViewController.countries = nil
            return
        }
        //      let selectedYear = selectedScopeYear()
        //      let allCountries = countries.values.joined()
        //      let filteredCountries = allCountries.filter { (country: Country) -> Bool in
        //        let isMatchingYear = selectedYear == Year.all.description ? true : (country.year.description == selectedYear)
        //        if searchText != "" {
        //          return
        //            isMatchingYear &&
        //            country.name.lowercased().contains(searchText.lowercased())
        //        }
        //        return false
        //      }
        //      resultsTableViewController.countries = filteredCountries
        
        
    }
}


extension MoviesViewController: MovieSelectionDelegate {
    
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

extension MoviesViewController: UISearchBarDelegate  {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFor(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

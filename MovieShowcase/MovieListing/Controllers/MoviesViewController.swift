//
//  MoviesViewController.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import UIKit

class MoviesViewController: UIViewController {
    
    //IBOutlates
    @IBOutlet var movieListTableView: UITableView!
    
    //Variables
    private var movieListVm: MovieListViewModel?
    var pageIndex: String {
        get{
            return movieListVm?.pageIndex ?? "1"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                DispatchQueue.main.async {
                    self.movieListTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension MoviesViewController:
    UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListVm?.numberOfMovies ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieInfoCell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoViewCell", for: indexPath) as? MovieInfoViewCell else {
            fatalError("Couldn't create the movie info cell!!")
        }
        let movieVm = movieListVm?.movieAtIndex(indexPath.row)
        movieInfoCell.movieViewModel = movieVm
        return movieInfoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieInfoVM = movieListVm?.movieAtIndex(indexPath.row)
        let movieDetailVC = MovieDetailsViewController.instantiateFromStoryboard()
        guard let movieID = movieInfoVM?.Id else {return}
        movieDetailVC.movieId = movieID
        DispatchQueue.main.async {
            self.navigationController?.show(movieDetailVC, sender: nil)
        }
        
    }
    
    
}

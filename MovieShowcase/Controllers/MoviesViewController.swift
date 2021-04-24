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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getMoviesList()
    }
    
    
    private func getMoviesList() {

        let urlText = MovieRequest.nowPlaying.getEndPoint()
        
        let resource = Resource<NowPlaying>(url: urlText)
        WebServices().load(resource: resource) { result in
            
            switch result {
            case .success(let nowPlaying):
                self.movieListVm = MovieListViewModel(movies: nowPlaying.movies)
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
            fatalError("Couldn't create the movie info cell")
        }
        let movieVm = movieListVm?.movieAtIndex(indexPath.row)
        movieInfoCell.movieViewModel = movieVm
        return movieInfoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieInfoVM = movieListVm?.movieAtIndex(indexPath.row)
        
        
        
    }
    
    
}

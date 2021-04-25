//
//  MovieListDelegates.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit


// UITableViewDelegates for MovieListTableView
class MovieListDelegates: GenericDataSource<Movie>, UITableViewDelegate {
    
    //Delegate for movie selection
    weak var delegate: MovieSelectionDelegate?
    
    init(withDelegate delegate: MovieSelectionDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedCell(row: indexPath.row)
    }
}

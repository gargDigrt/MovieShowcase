//
//  MovieListDelegates.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import UIKit

protocol MovieSelectionDelegate: UIViewController {
    func selectedCell(row: Int)
}

class MovieListDelegates: GenericDataSource<Movie>, UITableViewDelegate {
    
    weak var delegate: MovieSelectionDelegate?
    
    init(withDelegate delegate: MovieSelectionDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedCell(row: indexPath.row)
        
    }
}

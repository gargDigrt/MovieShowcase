//
//  GenericDataSource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation

/// A Generic class for DataSources
class GenericDataSource<T>: NSObject {
    var data:[T] = []
}

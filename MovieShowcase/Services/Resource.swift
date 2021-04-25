//
//  Resource.swift
//  MovieShowcase
//
//  Created by Vivek on 25/04/21.
//

import Foundation


/// A model class for the resource to form a URLRequest
struct Resource<T: Codable> {
    var urlRequest: URLRequest

    init(_ url: String,_ params: [String: String] = DEFAULT_PARAMS,_ method: HttpMethod = .get) {
        var urlComp = URLComponents(string: url)!
        var queries:[URLQueryItem] = []
        for key in params.keys{
           let newQuery = URLQueryItem(name: key, value: params[key])
            queries.append(newQuery)
        }
        urlComp.queryItems = queries
        urlRequest = URLRequest(url: urlComp.url!)
        urlRequest.httpMethod = method.rawValue
    }
}

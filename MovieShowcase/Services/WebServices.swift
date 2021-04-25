//
//  WebServices.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation


/// Webservice
/// Contains methods for API service requests
class WebServices {
    
    
    /// Method to request URLRequest
    /// - Parameters:
    ///   - resource: Resource of generic type
    ///   - completion: Result object
    func load<T>(resource: Resource<T>, completion: @escaping(Result<T, NetworkingError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.urlRequest){ data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            let decoded = try? JSONDecoder().decode(T.self, from: data)
            if let result = decoded {
                completion(.success(result))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    
}

//
//  WebServices.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import Foundation

enum NetworkingError: Error {
    case domainError
    case decodingError
    case connectivityError
    
}

struct Resource<T: Codable> {
    let urlRequest: URLRequest

    init(url: String) {
        var urlComp = URLComponents(string: url)!
        urlComp.queryItems = [
            URLQueryItem(name: "api_key", value: AppConfig.apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        urlRequest = URLRequest(url: urlComp.url!)
    }
}

class WebServices {
    
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

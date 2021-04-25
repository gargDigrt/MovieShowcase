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

enum HttpMethod: String {
    case get
    case post
}

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

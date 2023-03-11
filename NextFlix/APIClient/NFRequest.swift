//
//  NFRequest.swift
//  NextFlix
//
//  Created by Thiago Leite on 09/03/23.
//

import Foundation

final class NFRequest {
    /// API Constants
    private struct Constants {
        static let api_key = "108661ea715104563c4f2bc3bfe8a8da"
        static let baseUrl = "https://api.themoviedb.org/3/discover/movie?api_key=\(api_key)&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
        
    }
    
    private let endpoint: NFEndpoint
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
//        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Construct request
     /// - Parameters:
     ///   - endpoint: Target endpoint
     ///   - pathComponents: Collection of Path components
     ///   - queryParameters: Collection of query parameters
    public init(endpoint: NFEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []
    ){
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
   
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
}

extension NFRequest {
    static let listMoviesRequests = NFRequest(endpoint: .movie)
}


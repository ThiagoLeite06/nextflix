//
//  MovieService.swift
//  NextFlix
//
//  Created by Thiago Leite on 04/11/21.
//

import Foundation
import UIKit

protocol ServiceProtocol {
    func fetchData(completion: @escaping ([Movie]) -> Void)
}

class MovieService: ServiceProtocol {
   
    
    let url_base = "https://api.themoviedb.org/3"
    let api_key = "108661ea715104563c4f2bc3bfe8a8da"
   
    func fetchData(completion: @escaping ([Movie]) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "\(self.url_base)/discover/movie?api_key=\(self.api_key)&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate")!
        let task = session.dataTask(with: url) { data, response, error in
            guard let result = data else { return }
            
            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: result)
                completion(response.results)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func fetchCast(movieId: Int, completion: @escaping ([Cast]) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "\(self.url_base)/movie/\(movieId)/credits?api_key=\(self.api_key)&language=pt-BR")!
        let task = session.dataTask(with: url) { data, response, error in
            guard let result = data else { return }
            
            do {
                let response = try JSONDecoder().decode(CastResponse.self, from: result)
                completion(response.cast)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
   
}

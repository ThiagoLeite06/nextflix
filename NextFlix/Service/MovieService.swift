//
//  MovieService.swift
//  NextFlix
//
//  Created by Thiago Leite on 04/11/21.
//

import Foundation
import UIKit

class MovieService {
    let url_base = "https://api.themoviedb.org/3"
    let api_key = "108661ea715104563c4f2bc3bfe8a8da"
   
    func getMovieByPopularity(completion: @escaping (Movie?) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "\(self.url_base)/discover/movie?api_key=\(self.api_key)&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate")!
        let task = session.dataTask(with: url) { data, response, error in
            guard let result = data else { return }
            
            do {
                let movie = try JSONDecoder().decode(Movie.self, from: result)
                completion(movie)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
    }
   
}

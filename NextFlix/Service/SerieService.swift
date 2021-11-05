//
//  SerieService.swift
//  NextFlix
//
//  Created by Lilian on 04/11/21.
//

import Foundation
import UIKit

protocol ServiceProtocolSerie {
    func loadSeries(completion: @escaping ([Serie]) -> Void)
}

class SerieService: ServiceProtocolSerie {
    
    
    let url_base = "https://api.themoviedb.org/3"
    let api_key = "108661ea715104563c4f2bc3bfe8a8da"
    
    func loadSeries(completion: @escaping ([Serie]) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "\(self.url_base)/discover/tv?api_key=\(self.api_key)&language=pt-BR&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate")!
        let task = session.dataTask(with: url) { data, response, error in
            guard let result = data else { return }
            
            do {
                let response = try JSONDecoder().decode(SerieResponse.self, from: result)
                completion(response.results)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
   
}


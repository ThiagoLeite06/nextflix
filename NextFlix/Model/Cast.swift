//
//  Elenco.swift
//  NextFlix
//
//  Created by Lilian on 03/11/21.
//

import Foundation
import UIKit

struct Cast: Codable {
    let name: String
    let profile_path: String?
}

extension Cast: Content {
    var title: String {
         return name
     }
    
    var overview: String {
        return ""
    }
    
    var id: Int {
        return 0
    }
    
    var poster_path: String {
        return ""
    }
    
    var vote_average: Double {
        return 0
    }
    
    var cover: URL? {
         return URL(string: "https://image.tmdb.org/t/p/w500" + (profile_path ?? ""))
     }
}



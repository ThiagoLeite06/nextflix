//
//  Serie.swift
//  NextFlix
//
//  Created by Gui Feitosa on 22/10/21.
//

import Foundation
import UIKit

class Serie {
    
    let imageSerie: String
    let titleSerie: String
    let bornIn: String
    let description: String
    
    init (imagemSerie: String, titleSerie: String, bornIn: String, description: String) {
        
        self.imageSerie = imagemSerie
        self.titleSerie = titleSerie
        self.bornIn = bornIn
        self.description = description
    }
}

//
//  SerieViewModel.swift
//  NextFlix
//
//  Created by Gui Feitosa on 07/11/21.
//

import Foundation

protocol SerieViewModelDelegate {
    func loadData()
}

class SerieViewModel {
    
    var delegate: SerieViewModelDelegate?
    
    public let service = SerieService()

    public func loadData() {
        delegate?.loadData()
    }
    
    
}

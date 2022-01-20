//
//  MovieServiceSpec.swift
//  NextFlixTests
//
//  Created by Gui Feitosa on 19/01/22.
//

import UIKit
import Nimble
import Quick
@testable import NextFlix

class MovieServiceSpec: QuickSpec {
    
    override func spec() {
        
            
            var sut: MovieService!
            
            context("ServiceProtocol") {
                it("Verify ServiceProtocol") {
                    sut = MovieService()
                    expect(sut.url_base).to(equal("https://api.themoviedb.org/3"))
                }
            }
        }
}

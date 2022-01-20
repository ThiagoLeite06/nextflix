//
//  NextFlixTests.swift
//  NextFlixTests
//
//  Created by Thiago Leite on 08/12/21.
//

import XCTest

@testable import NextFlix

class NextFlixTests: XCTestCase {
    
    func testMovieService_whenURLBasePropertyIsChecked_theShouldBeEqualToExpectedURLBase() throws {
        
        let service = MovieService()
        
        XCTAssertEqual(service.url_base, "https://api.themoviedb.org/3")
    }
}

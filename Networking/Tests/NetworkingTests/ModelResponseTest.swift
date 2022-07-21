//
//  ResponseTest.swift
//  
//
//  Created by Yago Teixeira on 15/07/22.
//

import XCTest
@testable import Networking

class ModelResponseTest: XCTestCase {

    func mapToModel() throws {
        //given
        let movieResponse = MovieResponse(id: 1, posterPath: "posterPath", title: "title", overview: "overview")
        let movieCatalogResponse = MovieCatalogResponse(results: [movieResponse])
        
        //when
        let mappedMovie = movieResponse.mapToModel()
        let mappedMovieCatalog = movieCatalogResponse.mapToModel()

        //then
        mappedMovie.forEach {
            XCTAssertEqual($0.id, movieResponse.id)
            XCTAssertEqual($0.overview, movieResponse.overview)
            XCTAssertEqual($0.title, movieResponse.title)
            XCTAssertEqual($0.posterPath, movieResponse.posterPath)
        }
        
        for (movieObj, movieResponseObj) in zip(mappedMovieCatalog, movieCatalogResponse.results ?? []) {
            XCTAssertEqual(movieObj.id, movieResponseObj.id)
            XCTAssertEqual(movieObj.overview, movieResponseObj.overview)
            XCTAssertEqual(movieObj.title, movieResponseObj.title)
            XCTAssertEqual(movieObj.posterPath, movieResponseObj.posterPath)
        }

    }
}

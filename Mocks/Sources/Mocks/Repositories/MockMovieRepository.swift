//
//  File.swift
//  
//
//  Created by Yago Teixeira on 18/07/22.
//

import Foundation
import Domain
import Networking

public class MockMovieRepository: MovieRepository {
    
    public func popular(completion: @escaping ([Movie]) -> Void) {
        completion(readJson(name: "popular"))
    }
    
    public func topRated(completion: @escaping ([Movie]) -> Void) {
        completion(readJson(name: "topRated"))
    }
    
    public func upcoming(completion: @escaping ([Movie]) -> Void) {
        completion(readJson(name: "upcoming"))
    }
    
    private func readJson(name: String) -> [Movie] {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let result = try! JSONDecoder().decode(MovieResponse.self, from: data)
            return result.mapToModel()
        }
        return []
    }
}

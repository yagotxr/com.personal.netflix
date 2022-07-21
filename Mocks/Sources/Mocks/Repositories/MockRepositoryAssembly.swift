//
//  File.swift
//  
//
//  Created by Yago Teixeira on 18/07/22.
//

import Foundation
import Swinject
import Domain

public class MockRepositoryAssembly: Assembly {
    
    public func assemble(container: Container) {
        container.register(MovieRepository.self) { _ in
            MockMovieRepository()
        }
    }
}

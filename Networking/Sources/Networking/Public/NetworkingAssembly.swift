//
//  File.swift
//  
//
//  Created by Yago Teixeira on 13/07/22.
//

import Foundation
import Swinject
import Domain

class NetworkingAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DataSource.self) { _ in AlamofireRequests() }
        container.register(MovieRepository.self) { resolver in
            guard let networkingService = resolver.resolve(DataSource.self) else {
                fatalError("Unable to resolve \(DataSource.self)")
            }
            
            return DefaultMovieRepository(dataSource: networkingService)
        }
    }
    
}

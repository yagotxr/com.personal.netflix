import Foundation

public protocol FetchMovieCatalogUseCase {
    
    func execute(completionHandler: @escaping ([MovieListCategory: [Movie]]) -> Void)
    
}

public class DefaultFetchMovieCatalogUseCase: FetchMovieCatalogUseCase {
    
    typealias MovieCatalogDict = [MovieListCategory: [Movie]]
    let repository: MovieRepository
    
    let dispatchGroup = DispatchGroup()
    var movieCatalog = MovieCatalogDict()
    
    public init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute(completionHandler: @escaping ([MovieListCategory: [Movie]]) -> Void) {
        callRepo(category: .popular, function: repository.popular)
        callRepo(category: .topRated, function: repository.topRated)
//        callRepo(category: NSLocalizedString("latest", comment: String()), function: repository.latest)
        callRepo(category: .upcoming, function: repository.upcoming)
        
        dispatchGroup.notify(queue: .global()) {
            completionHandler(self.movieCatalog)
        }
    }
    
    private func callRepo(category: MovieListCategory, function: (@escaping ([Movie]) -> Void) -> Void) {
        dispatchGroup.enter()
        function { movies in
            self.movieCatalog[category] = movies
            self.dispatchGroup.leave()
        }
    }
}



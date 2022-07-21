import Foundation
import Domain

public protocol Response: Codable {
    
    func mapToModel() -> [Movie]
    
}

public struct MovieResponse: Codable {
    
    public let id: Int?
    public let posterPath: String?
    public let title: String?
    public let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        
        case id
        case title
        case overview
    }
}

public struct MovieCatalogResponse: Codable {
    
    public let results: [MovieResponse]?
    
}

extension MovieResponse: Response {
    
    public func mapToModel() -> [Movie] {
        return [Movie(id: self.id ?? .zero,
                     posterPath: self.posterPath ?? String(),
                     title: self.title ?? String(),
                     overview: self.overview ?? String())]
    }
    
}

extension MovieCatalogResponse: Response {
    
    public func mapToModel() -> [Movie] {
        var movieModels: [Movie] = []
        self.results?.forEach {
            movieModels.append(contentsOf: $0.mapToModel())
        }
        return movieModels
    }
}

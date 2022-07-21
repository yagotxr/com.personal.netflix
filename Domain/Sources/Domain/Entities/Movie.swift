import Foundation

public struct Movie {
    
    public let id: Int
    public let posterPath: String
    public let title: String
    public let overview: String

    public init(id: Int, posterPath: String, title: String, overview: String) {
        self.id = id
        self.posterPath = posterPath
        self.title = title
        self.overview = overview
    }
}

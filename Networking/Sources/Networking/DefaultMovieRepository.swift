import Foundation
import Domain

class DefaultMovieRepository: MovieRepository {
    
    public static let API_KEY_ENV_VAR = "apiKey"
    public static let API_KEY_QUERY_PARAM = "api_key"
    
    private let dataSource: DataSource
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    private let apiKey = ProcessInfo.processInfo.environment[API_KEY_ENV_VAR] ?? String()
    
    func popular(completion: @escaping ([Movie]) -> Void) {
        let path = RequestUrls.buildPath(.popularMoviesList)
        
        let endpoint = Endpoint(path: path,
                                method: .get,
                                queryParameters: [DefaultMovieRepository.API_KEY_QUERY_PARAM: apiKey])
        
        sendRequest(with: endpoint, model: MovieCatalogResponse.self, completion: completion)
    }
    
//    func latest(completion: @escaping ([Movie]) -> Void) {
//        guard let path = RequestUrls.map.single[.latestRelease] else {
//            return
//        }
//        
//        let endpoint = Endpoint(path: path,
//                                method: .get,
//                                queryParameters: [DefaultMovieRepository.API_KEY_QUERY_PARAM: apiKey])
//        
//        sendRequest(with: endpoint, model: MovieResponse.self, completion: completion)
//    }
    
    func topRated(completion: @escaping ([Movie]) -> Void)  {
        let path = RequestUrls.buildPath(.topRatedMoviesList)

        
        let endpoint = Endpoint(path: path,
                                method: .get,
                                queryParameters: [DefaultMovieRepository.API_KEY_QUERY_PARAM: apiKey])
        
        sendRequest(with: endpoint, model: MovieCatalogResponse.self, completion: completion)
    }
    
    func upcoming(completion: @escaping ([Movie]) -> Void)  {
        let path = RequestUrls.buildPath(.upcomingMoviesList)

        let endpoint = Endpoint(path: path,
                                method: .get,
                                queryParameters: [DefaultMovieRepository.API_KEY_QUERY_PARAM: apiKey])
        
        sendRequest(with: endpoint, model: MovieCatalogResponse.self, completion: completion)
    }
    
    
    
    private func sendRequest<E: Response>(with endpoint: Endpoint, model: E.Type, completion: @escaping ([Movie]) -> Void) {
        dataSource.request(with: endpoint) { data in
            guard let data = data else {
                return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(E.self, from: data) else {
              return
            }
            
            let movies = self.mapToModel(decodedResponse)
            completion(movies)
        }
    }
    
    private func mapToModel(_ decodedResponse: Response) -> [Movie] {
        decodedResponse.mapToModel()
    }
}


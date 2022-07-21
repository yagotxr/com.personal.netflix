import Foundation
import Alamofire

public enum HTTPMethodType: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

protocol Requestable {}

class Endpoint: Requestable {
    
    private let path: String
    private let method: HTTPMethodType
    private let queryParameters: [String: String]
        
    init(path: String,
         method: HTTPMethodType,
         queryParameters: [String: String]?) {
        self.path = path
        self.method = method
        self.queryParameters = queryParameters ?? [:]
    }
}

extension Endpoint {
    public var urlRequest: URLRequest {
        let queryItems = buildQuery()
        
        guard var urlComps = URLComponents(string: path) else {
            fatalError()
        }
        urlComps.queryItems = queryItems
    
        guard let url = urlComps.url else {
            fatalError()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }

    private func buildQuery() -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        queryParameters.forEach {
            queryItems.append(URLQueryItem.init(name: $0.key, value: $0.value))
        }
        return queryItems
    }
}

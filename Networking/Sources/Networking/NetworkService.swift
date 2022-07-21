import Foundation
import Alamofire
import Domain
import UIKit

protocol DataSource {
    func request(with endpoint: Endpoint, completion: @escaping (Data?) -> Void)
}

class AlamofireRequests: DataSource {
    func request(with endpoint: Endpoint, completion: @escaping (Data?) -> Void) {
        let encodedUrlRequest: URLRequestConvertible = endpoint.urlRequest
        AF.request(encodedUrlRequest).response { response in
                switch response.result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    print(error)
            }
        }.cURLDescription { description in
            print(description)
        }
    }
}

class URLSessionRequests: DataSource {
    func request(with endpoint: Endpoint, completion: @escaping (Data?) -> Void) {
        let urlObj = endpoint.urlRequest
        
        let task = URLSession.shared.dataTask(with: urlObj) {(data, response, error) in
            
            if let data = data {
                completion(data)
            } else {
                print(error?.localizedDescription as Any)
            }
        }
        
        task.resume()
    }
}

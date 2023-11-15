//
//  NetworkManager.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation


protocol NetworkManagerProtocol {
    func makeRequestWith<T: Decodable>(_ request: APIRequestProtocol, completion: @escaping (Result<T, NetworkError>) -> ())
}


class NetworkManager: NetworkManagerProtocol {
    private let session: URLSession
    
    init(urlSession: URLSession = URLSession.shared){
        self.session = urlSession
    }
    
    func makeRequestWith<T>(_ request: APIRequestProtocol, completion: @escaping (Result<T, NetworkError>) -> ()) where T : Decodable {
        guard let urlRequest = request.createURLRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            
        }.resume()
    }
    
}

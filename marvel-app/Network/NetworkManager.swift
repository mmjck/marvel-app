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
    
    func makeRequestWith<T>(_ request: <<error type>>, completion: @escaping (Result<T, NetworkError>) -> ()) where T : Decodable {
        <#code#>
    }
    
}

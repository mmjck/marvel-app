//
//  ApiRequestProtocol.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation

protocol APIRequestProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }

    var httpMethod: HTTPRequestMethod { get }
    var headers: [String: String] { get }
    var bodyParams: [String: Any] { get }
    
    
    var queryParams: [String: String] { get }
}


extension APIRequestProtocol {
    var headers: [String: String] {
        [:]
    }
    
    var bodyParams: [String: Any] {
        [:]
    }
    
    var queryParams: [String: String] {
        [:]
    }
}


extension APIRequestProtocol {
    func createURLRequest() -> URLRequest? {
        var components = URLComponents()
        
        components.scheme = scheme
        components.host = host
        components.path = path
        
        
        if !queryParams.isEmpty {
            components.queryItems = queryParams.map {
                URLQueryItem(name: $0, value: $1)
                
            }
        }
        
        guard let url = components.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if !bodyParams.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParams)
        }
        
        return urlRequest

    }
}

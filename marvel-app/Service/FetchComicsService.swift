//
//  FetchComicsService.swift
//  marvel-app
//
//  Created by Jackson Matheus on 20/11/23.
//

import Foundation

typealias comicsData = NetworkResponse<ComicsResponse>
typealias comicsResult = Result<comicsData, NetworkError>



protocol FetchComicsProtocol {
    func fetchComicsForCharacter(id: Int, offset: Int, completion: @escaping (comicsResult) -> Void)
}


final class FetchComicsService: FetchComicsProtocol {
    func fetchComicsForCharacter(id: Int, offset: Int, completion: @escaping (comicsResult) -> Void) {
        let request = MarvelRequest.comicsForCharacter(id: id, offset: offset)
        
        apiManager.makeRequestWith(request) {
            result in
            completion(result)
        }
    }
    
    
    private let apiManager: NetworkManagerProtocol
    
    
    init(apiManager: NetworkManagerProtocol = NetworkManager()){
        self.apiManager = apiManager
    }
    
   
}

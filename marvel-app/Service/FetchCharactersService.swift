//
//  FetchCharactersService.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation


typealias charactersData = NetworkResponse<CharactersResponse>
typealias charactersResult = Result<charactersData, NetworkError>


protocol FetchCharactersProtocol {
    func fetchCharactersList(offset: Int, completion: @escaping (charactersResult) -> Void)
    
    func searchForCharacters(name: String, completion: @escaping (charactersResult) -> Void)
    
    
    func fetchCharactersForComic(id: Int, offset: String, completion: @escaping (charactersResult) -> Void)
    
    
}


final class FetchCharactersService: FetchCharactersProtocol {
    private let apiManager: NetworkManager
}
    


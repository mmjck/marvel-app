//
//  MarvelRequest.swift
//  marvel-app
//
//  Created by Jackson Matheus on 15/11/23.
//

import Foundation


enum MarvelRequest: APIRequestProtocol {
    case charactersList(offset: Int)
    case searchCharacters(name: String, offset: Int)
    case comicsForCharacter(id: Int, offset: Int)
    case charactersForComic(id: Int, offset: Int)
    
    var scheme: String {
        switch self {
        case .charactersList, .searchCharacters, .comicsForCharacter, .charactersForComic:
            return "https"
        }
    }
    
    var host: String {
        return "gateway.marvel.com"
//        switch self {
//        case .charactersList,
//                .searchCharacters,
//                .comicsForCharacter, .charactersForComic:
//            return "gateway.marvel.com:443"
//        }
    }
    
    var path: String {
        switch self {
        case .charactersList, .searchCharacters:
            return "/v1/public/characters"
        case let .comicsForCharacter(id, _):
            return "/v1/public/characters/\(id)/comics"
        case let .charactersForComic(id, _):
            return "/v1/public/comics/\(id)/characters"
        }
    }
    
    var httpMethod: HTTPRequestMethod {
        switch self {
        case .charactersList, .searchCharacters, .comicsForCharacter, .charactersForComic:
            return HTTPRequestMethod.get
        }
    }
    
    var queryParams: [String: String] {
        var params = defaultQueryItems
        
        switch self {
        case let .charactersList(offset):
            params["offset"] = "\(offset)"
        case let .searchCharacters(name, offset):
            params["nameStartsWith"] = name
            params["offset"] = "\(offset)"
        case let .comicsForCharacter(_, offset):
            params["offset"] = "\(offset)"
        case let .charactersForComic(_, offset):
            params["offset"] = "\(offset)"
        }
        
        return params
    }
    
    // MARK: - Marvel Default Query Parameters
    private var defaultQueryItems: [String: String] {
        let timestamp = "\(Date().timeIntervalSince1970)"
        
        let hashParam = ("\(timestamp)\(Constants.MarvelAPIPrivateKey)\(Constants.MarvelAPIPublicKey)").md5
        
        return [
            "apikey": Constants.MarvelAPIPublicKey,
            "ts": timestamp,
            "hash": hashParam
        ]
    }
}

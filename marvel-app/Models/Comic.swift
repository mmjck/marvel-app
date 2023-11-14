//
//  Comic.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation

struct ComicResponse: Decodable {
    var results: [Comic]
}

struct Comic: Decodable {
    let id: String
    let title: String
    let thumbnail: Thumbnail?
    
    var picture: URL? {
        let url = (thumbnail?.path ?? "") + "." +
        (thumbnail?.imageExtension ?? "")
        
        return URL(string: url)
    }
}

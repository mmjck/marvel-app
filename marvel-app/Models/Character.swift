//
//  Character.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation


struct CharactersData: Decodable {
    var data: CharactersResponse
}

struct CharactersResponse: Decodable {
    var results: [Character]
}


struct Character: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail?
    var imageData: Data?

    
    var pictureURL: URL? {
        let url = (thumbnail?.path ?? "") + "." + (thumbnail?.imageExtension ?? "")
        return URL(string: url)
    }
}

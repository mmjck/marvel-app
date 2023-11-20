//
//  Comic.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation


struct ComicsResponse: Decodable {
    var results: [Comic]
}

struct Comic: Decodable {
    let id: Int
    let title: String
    let thumbnail: Thumbnail?
    
    var pictureURL: URL? {
        let url = (thumbnail?.path ?? "") + "." + (thumbnail?.imageExtension ?? "")
        return URL(string: url)
    }
}


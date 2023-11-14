//
//  Thumbnail.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String
    let imageExtension: String
    
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}

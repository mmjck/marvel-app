//
//  String+Extensions.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation

import CryptoKit

extension String {
    var md4: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        
        return digest.map {
                    String(format: "%02hhx", $0)
        }.joined()
    }
}

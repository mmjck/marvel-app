//
//  NetworkResponse.swift
//  marvel-app
//
//  Created by Jackson Matheus on 15/11/23.
//

import Foundation


struct NetworkResponse <Wrapped: Decodable>: Decodable {
    var data: Wrapped
}

//
//  ViewCode.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation
import UIKit

protocol ViewCode {
    func loadView()
    func addSubviews()
    func addConstraints()
    func additionalConfig()
}

extension ViewCode {
    func loadView(){
        addSubviews()
        addConstraints()
        additionalConfig()
    }
    
    func additionalConfig(){
        
    }
}

//
//  UIFonts+Extension.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//

import Foundation
import UIKit

extension UIFont  {
    static func cairo(_ type: FontType, size: CGFloat) -> UIFont? {
        return UIFont(name: "Cairo-\(type)", size: size)
    }
    
    static func inder(_ type: FontType, size: CGFloat) -> UIFont? {
        return UIFont(name: "Inder-\(type)", size: size)
    }
    
    
    enum FontType: String {
        case regular = "Regular"
        case semibold = "SemiBold"
        case bold = "Bold"
    }
}

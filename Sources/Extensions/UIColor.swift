//
//  UIColor.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public extension UIColor {
    private static var _colorCache: [String:UIColor] = [:]
    
    public class func p3_fromHexColorConvertible<C: HexColorConvertible>(hexColorConvertible: C) -> UIColor {
        return UIColor(p3_hex: hexColorConvertible.hexColor)
    }
    
    public convenience init(p3_hex hex: String) {
        if let c = UIColor._colorCache[hex] {
            self.init(cgColor: c.cgColor)
        } else {
            var red:   CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue:  CGFloat = 0.0
            var alpha: CGFloat = 1.0
            
            if hex.hasPrefix("#") {
                let index   = hex.index(after: hex.startIndex)
                let hex     = hex.substring(from: index)
                let scanner = Scanner(string: hex)
                var hexValue: CUnsignedLongLong = 0
                if scanner.scanHexInt64(&hexValue) {
                    switch hex.characters.count {
                    case 3:
                        red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                        green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                        blue  = CGFloat(hexValue & 0x00F)              / 15.0
                    case 4:
                        red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                        green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                        blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                        alpha = CGFloat(hexValue & 0x000F)             / 15.0
                    case 6:
                        red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                        green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                        blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                    case 8:
                        red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                        green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                        blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                        alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                    default:
                        print("Invalid HEX string, number of characters after '#' should be either 3, 4, 6 or 8")
                    }
                } else {
                    print("Scan HEX error")
                }
            } else {
                print("Invalid HEX string, missing '#' as prefix")
            }
            
            let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            UIColor._colorCache[hex] = color
            
            self.init(red:red, green:green, blue:blue, alpha:alpha)
        }
    }
}


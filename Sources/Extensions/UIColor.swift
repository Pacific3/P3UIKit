//
//  UIColor.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

#if os(iOS) || os(tvOS)
    public typealias P3Color = UIColor
#else
    public typealias P3Color = NSColor
#endif

public extension P3Color {
    private static var _colorCache: [String:P3Color] = [:]
    
    public class func p3_fromHexColorConvertible<C: HexColorConvertible>(hexColorConvertible: C) -> P3Color {
        return P3Color(p3_hex: hexColorConvertible.hexColor)
    }
    
    public convenience init(p3_hex hex: String) {
        if let c = P3Color._colorCache[hex] {
            #if os(iOS) || os(tvOS)
                self.init(cgColor: c.cgColor)
            #else
                self.init(calibratedRed: c.redComponent, green: c.greenComponent, blue: c.blueComponent, alpha: c.alphaComponent)
            #endif
        } else {
            var red:   CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue:  CGFloat = 0.0
            var alpha: CGFloat = 1.0
            
            if hex.hasPrefix("#") {
                let index   = hex.index(after: hex.startIndex)
                let hex     = "\(hex[index...])"
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
            
            #if os(iOS) || os(tvOS)
                let color = P3Color(red: red, green: green, blue: blue, alpha: alpha)
                P3Color._colorCache[hex] = color
                
                self.init(cgColor: color.cgColor)
            #else
                let color = P3Color(
                    calibratedRed: red, 
                    green: green, 
                    blue: blue, 
                    alpha: alpha
                )
                P3Color._colorCache[hex] = color
                
                self.init(
                    calibratedRed: color.redComponent, 
                    green: color.greenComponent, 
                    blue: color.blueComponent, 
                    alpha: color.alphaComponent
                )
            #endif
        }
    }
}


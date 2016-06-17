//
//  ColorConvertible.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public protocol ColorConvertible: HexColorConvertible {
    func color() -> UIColor
}

extension ColorConvertible {
    public func color() -> UIColor {
        return UIColor.p3_fromHexColorConvertible(hexColorConvertible: self)
    }
}


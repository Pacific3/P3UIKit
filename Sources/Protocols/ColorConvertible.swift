//
//  ColorConvertible.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public protocol ColorConvertible: HexColorConvertible {
    func color() -> P3Color
}

public extension ColorConvertible {
    public func color() -> P3Color {
        return P3Color.p3_fromHexColorConvertible(hexColorConvertible: self)
    }
}


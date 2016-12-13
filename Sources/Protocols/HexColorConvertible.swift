//
//  HexColorConvertible.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public protocol HexColorConvertible: Hashable {
    var hexColor: String { get }
}

public extension HexColorConvertible {
    public var hashValue: Int {
        return hexColor.hashValue
    }
}

public func ==<C: HexColorConvertible>(lhs: C, rhs: C) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

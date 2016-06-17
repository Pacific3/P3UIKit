//
//  ImageNameConvertible.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public protocol ImageNameConvertible: Hashable {
    var imageName: String { get }
    var bundle: Bundle { get }
}

extension ImageNameConvertible {
    public var hashValue: Int {
        return imageName.hashValue
    }
}

public func ==<I: ImageNameConvertible>(lhs: I, rhs: I) -> Bool {
    return lhs.hashValue == rhs.hashValue
}


//
//  ImageConvertible.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public protocol ImageConvertible: ImageNameConvertible {
    func image() -> P3Image?
}

public extension ImageConvertible {
    public func image() -> P3Image? {
        return P3Image.p3_fromImageNameConvertible(imageNameConvertible: self)
    }
}

//
//  ImageConvertible.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public protocol ImageConvertible: ImageNameConvertible {
    func image() -> UIImage?
}

public extension ImageConvertible {
    public func image() -> UIImage? {
        return UIImage.p3_fromImageNameConvertible(imageNameConvertible: self)
    }
}

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

extension ImageConvertible {
    public func image() -> UIImage? {
        return UIImage.p_fromImageNameConvertible(imageNameConvertible: self)
    }
}

//
//  UIImageView.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

extension UIImageView {
    public func p3_setImage<I: ImageConvertible>(image: I) {
        self.image = image.image()
    }
}

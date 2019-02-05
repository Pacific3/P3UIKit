//
//  UIImageView.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

#if os(iOS) || os(tvOS)
    public typealias P3ImageView = UIImageView
#else
    public typealias P3ImageView = NSImageView
#endif

public extension P3ImageView {
    func p3_setImage<I: ImageConvertible>(image: I) {
        self.image = image.image()
    }
}

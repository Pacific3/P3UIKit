//
//  UIImage.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

#if os(iOS) || os(tvOS)
    public typealias P3Image = UIImage
#else
    public typealias P3Image = NSImage
#endif


public extension P3Image {
    public class func p3_fromImageNameConvertible<I: ImageNameConvertible>(imageNameConvertible: I) -> P3Image? {
        #if os(iOS) || os(tvOS)
            return P3Image(
                named: imageNameConvertible.imageName,
                in: imageNameConvertible.bundle,
                compatibleWith: nil
            )
        #else
            guard let imagePath = imageNameConvertible.bundle.pathForImageResource(imageNameConvertible.imageName) else {
                return nil
            }
            
            return P3Image(contentsOfFile: imagePath)
        #endif
    }
}

#if os(iOS) || os(tvOS)
    public extension P3Image {
        public class func p3_imageWithColor(color: P3Color) -> P3Image? {
            let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            
            context?.setFillColor(color.cgColor)
            context?.fill(rect)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return image
        }
        
        public class func p3_imageWithColor<C: ColorConvertible>(color: C) -> P3Image? {
            return p3_imageWithColor(color: color.color())
        }
        
        public class func p3_roundedImageWithColor(color: P3Color, size: CGSize) -> P3Image? {
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            let circleBezierPath = UIBezierPath(rect: rect)
            
            UIGraphicsBeginImageContext(size)
            
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(color.cgColor)
            circleBezierPath.fill()
            let bezierImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return bezierImage
        }
        
        public class func p3_roundedImageWithColor<C: ColorConvertible>(color: C, size: CGSize) -> P3Image? {
            return p3_roundedImageWithColor(color: color.color(), size: size)
        }
        
        public class func p3_roundedImageWithColor(color: P3Color) -> P3Image? {
            return p3_roundedImageWithColor(color: color, size: CGSize(width: 1, height: 1))
        }
        
        public class func p3_roundedImageWithColor<C: ColorConvertible>(color: C) -> P3Image? {
            return p3_roundedImageWithColor(color: color, size: CGSize(width: 1, height: 1))
        }
    }
#endif

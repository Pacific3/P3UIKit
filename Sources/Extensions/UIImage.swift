//
//  UIImage.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

extension UIImage {
    public class func p_fromImageNameConvertible<I: ImageNameConvertible>(imageNameConvertible: I) -> UIImage? {
        return UIImage(
            named: imageNameConvertible.imageName,
            in: imageNameConvertible.bundle,
            compatibleWith: nil
        )
    }
    
    public class func p_imageWithColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    public class func p_imageWithColor<C: ColorConvertible>(color: C) -> UIImage? {
        return p_imageWithColor(color: color.color())
    }
    
    public class func p_roundedImageWithColor(color: UIColor, size: CGSize) -> UIImage? {
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
    
    public class func p_roundedImageWithColor<C: ColorConvertible>(color: C, size: CGSize) -> UIImage? {
        return p_roundedImageWithColor(color: color.color(), size: size)
    }
    
    public class func p_roundedImageWithColor(color: UIColor) -> UIImage? {
        return p_roundedImageWithColor(color: color, size: CGSize(width: 1, height: 1))
    }
    
    public class func p_roundedImageWithColor<C: ColorConvertible>(color: C) -> UIImage? {
        return p_roundedImageWithColor(color: color, size: CGSize(width: 1, height: 1))
    }
}


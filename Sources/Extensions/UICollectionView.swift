//
//  UICollectionView.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 7/11/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

#if os(iOS) || os(tvOS)
    public extension UICollectionView {
        func register<T: UICollectionViewCell>(cellClass: T.Type) {
            register(cellClass, forCellWithReuseIdentifier: UICollectionView.reuseIdentifier(class: cellClass))
        }
        
        func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath, type: T.Type) -> T {
            guard let c = dequeueReusableCell(withReuseIdentifier: UICollectionView.reuseIdentifier(class: type), for: indexPath) as? T else {
                fatalError("Cell \(String(describing: type)) not configured correctly for reuse.")
            }
            
            return c
        }
        
        private static func reuseIdentifier<T: UICollectionViewCell>(class _class: T.Type) -> String {
            return (Bundle(for: _class).bundleIdentifier ?? "_P3BundleIdentifier") + String(describing: _class)
        }
    }
#endif



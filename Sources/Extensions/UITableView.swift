//
//  UITableView.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 7/11/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public extension UITableView {
    public func register<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: UITableView.reuseIdentifier(class: cellClass))
    }
    
    public func dequeue<T: UITableViewCell>(for indexPath: IndexPath, type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: UITableView.reuseIdentifier(class: type), for: indexPath) as! T
    }
    
    private static func reuseIdentifier<T: UITableViewCell>(class _class: T.Type) -> String {
        return (Bundle(for: _class).bundleIdentifier ?? "_P3BundleIdentifier") + String(_class)
    }
}

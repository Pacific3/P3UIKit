//
//  UITableView.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 7/11/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

#if os(iOS) || os(tvOS)
    public extension UITableView {
        public func register<T: UITableViewCell>(cellClass: T.Type) {
            register(cellClass, forCellReuseIdentifier: UITableView.reuseIdentifier(class: cellClass))
        }
        
        public func dequeue<T: UITableViewCell>(for indexPath: IndexPath, type: T.Type) -> T {
            guard let c = dequeueReusableCell(withIdentifier: UITableView.reuseIdentifier(class: type), for: indexPath) as? T else {
                fatalError("Cell \(String(describing: type)) not configured correctly for reuse.")
            }
        
            return c
        }
        
        private static func reuseIdentifier<T: UITableViewCell>(class _class: T.Type) -> String {
            return (Bundle(for: _class).bundleIdentifier ?? "_P3BundleIdentifier") + String(describing: _class)
        }
        
        func p3_layoutTableHeaderView() {
            guard let headerView = self.tableHeaderView else { return }
            headerView.translatesAutoresizingMaskIntoConstraints = false
            
            let headerWidth = headerView.bounds.size.width;
            let temporaryWidthConstraints = NSLayoutConstraint.constraints(
                withVisualFormat: "[headerView(width)]",
                options: NSLayoutFormatOptions(rawValue: UInt(0)),
                metrics: ["width": headerWidth],
                views: ["headerView": headerView]
            )
            
            headerView.addConstraints(temporaryWidthConstraints)
            
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
            
            let headerSize = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
            let height = headerSize.height
            var frame = headerView.frame
            
            frame.size.height = height
            headerView.frame = frame
            
            self.tableHeaderView = headerView
            
            headerView.removeConstraints(temporaryWidthConstraints)
            headerView.translatesAutoresizingMaskIntoConstraints = true
        }
    }
#endif

//
//  UIView.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 5/6/17.
//  Copyright © 2017 Pacific3. All rights reserved.
//

public extension UIView {
    public func p3_constraintsForFillingView(view: UIView) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
    }
}

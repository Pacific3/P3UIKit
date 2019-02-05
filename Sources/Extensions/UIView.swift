//
//  UIView.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 5/6/17.
//  Copyright © 2017 Pacific3. All rights reserved.
//

#if os(iOS) || os(tvOS)
    public typealias P3View = UIView
#else
    public typealias P3View = NSView
#endif

public extension P3View {
    func p3_constraintsForFillingView(view: P3View) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
    }
}

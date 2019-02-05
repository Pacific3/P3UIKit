//
//  P3AlertOperation.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

#if os(iOS) || os(tvOS)
    public final class P3AlertOperation: P3Operation {
        private let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        private let presentationContext: UIViewController?
        
        public var title: String? {
            get {
                return alertController.title
            }
            set {
                alertController.title = newValue
                name = newValue
            }
        }
        
        public var message: String? {
            get {
                return alertController.message
            }
            set {
                alertController.message = newValue
            }
        }
        
        public init(presentationContext: UIViewController? = nil) {
            self.presentationContext = presentationContext ?? UIApplication.shared.keyWindow?.rootViewController
            super.init()
            addCondition(condition: AlertPresentation())
            addCondition(condition: P3MutuallyExclusiveOperationCondition<UIViewController>())
        }
        
        public func addAction(title: String, style: UIAlertAction.Style = .default, handler: @escaping (P3AlertOperation) -> Void = { _ in }) {
            let action = UIAlertAction(title: title, style: style) { [weak self] _ in
                if let strongSelf = self {
                    handler(strongSelf)
                }
                
                self?.finish()
            }
            
            alertController.addAction(action)
        }
        
        
        override public func execute() {
            guard let presentationContext = presentationContext else {
                finish()
                
                return
            }
            
            p3_executeOnMainThread { [unowned self] in
                if self.alertController.actions.isEmpty {
                    self.addAction(title: "Ok")
                }
                
                presentationContext.present(self.alertController, animated: true, completion: nil)
            }
        }
    }
    
    public enum Alert { }
    public typealias AlertPresentation = P3MutuallyExclusiveOperationCondition<Alert>
    
#endif

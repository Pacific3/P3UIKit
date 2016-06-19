//
//  P3NetworkActivityObserver.swift
//  P3UIKit
//
//  Created by Oscar Swanros on 6/17/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

public struct P3NetworkActivityObserver: P3OperationObserver {
    public init() { }
    
    public func operationDidStart(operation: Operation) {
        p3_executeOnMainThread {
            NetworkIndicatorManager.sharedManager.networkActivityDidStart()
        }
    }
    
    public func operationDidFinish(operation: Operation, errors: [NSError]) {
        p3_executeOnMainThread {
            NetworkIndicatorManager.sharedManager.networkActivityDidEnd()
        }
    }
    
    public func operation(operation: Operation, didProduceOperation newOperation: Operation) { }
    
    public func operationDidCancel(operation: Operation) {
        p3_executeOnMainThread {
            NetworkIndicatorManager.sharedManager.networkActivityDidEnd()
        }
    }
}

private class NetworkIndicatorManager {
    static let sharedManager = NetworkIndicatorManager()
    
    private var activiyCount = 0
    private var visibilityTimer: Timer?
    
    func networkActivityDidStart() {
        assert(Thread.isMainThread(), "Only on main thread!")
        
        activiyCount += 1
        
        updateNetworkActivityIndicatorVisibility()
    }
    
    func networkActivityDidEnd() {
        assert(Thread.isMainThread(), "Only on main thread!")
        
        activiyCount -= 1
        
        updateNetworkActivityIndicatorVisibility()
    }
    
    private func updateNetworkActivityIndicatorVisibility() {
        if activiyCount > 0 {
            showIndicator()
        } else {
            
            visibilityTimer = Timer(interval: 1.0) {
                self.hideIndicator()
            }
        }
    }
    
    private func showIndicator() {
        visibilityTimer?.cancel()
        visibilityTimer = nil
        UIApplication.shared().isNetworkActivityIndicatorVisible = true
    }
    
    private func hideIndicator() {
        visibilityTimer?.cancel()
        visibilityTimer = nil
        UIApplication.shared().isNetworkActivityIndicatorVisible = false
    }
}

private class Timer {
    var isCancelled = false
    
    init(interval: TimeInterval, handler: (Void) -> Void) {
        let when = DispatchTime.now() + (Double(NSEC_PER_SEC) * interval)
        DispatchQueue.main.after(when: when) { [weak self] in
            if self?.isCancelled == false {
                handler()
            }
        }
        
    }
    
    func cancel() {
        isCancelled = true
    }
}


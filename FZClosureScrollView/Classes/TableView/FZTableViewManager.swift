//
//  FZTableViewManager.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/1.
//

import UIKit

/// All data sources and delegate methods are modified for closure processing.
/// The optional implementation method determines whether it can be called depending on when the appropriate closure is set
public class FZTableViewManager: FZScrollViewManager {

    // MARK: - property

    public var dataSourceDecorator: FZTableViewDataSourceDecorator?

    /// The assignment will override the FZScrollViewManager's delegateDecorator property
    public var tableViewDelegateDecorator: FZTableViewDelegateDecorator? {
        didSet {
            super.delegateDecorator = tableViewDelegateDecorator
        }
    }

    public var prefetchDataSourceDecorator: FZTableViewPrefetchDataSourceDecorator?

    fileprivate var _dragDelegateDecorator: Any?
    @available(iOS 11.0, *)
    public var dragDelegateDecorator: FZTableViewDragDelegateDecorator? {
        get {
            return _dragDelegateDecorator as? FZTableViewDragDelegateDecorator
        }
        set {
            _dragDelegateDecorator = newValue
        }
    }

    fileprivate var _dropDelegateDecorator: Any?
    @available(iOS 11.0, *)
    public var dropDelegateDecorator: FZTableViewDropDelegateDecorator? {
        get {
            return _dropDelegateDecorator as? FZTableViewDropDelegateDecorator
        }
        set {
            _dropDelegateDecorator = newValue
        }
    }

    // MARK: - override
    public override func responds(to aSelector: Selector!) -> Bool {
        if shouldCheckResponds(to: aSelector) {
            return checkResponds(to: aSelector)
        }
        return super.responds(to: aSelector)
    }
}

// MARK: - optional method check
extension FZTableViewManager {

    /// Whether the selector is an optional method
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional
    private func shouldCheckResponds(to selector: Selector) -> Bool {
        if isDataSourceSelector(selector)
            || isDelegateSelector(selector)
            || isPrefetchDataSourceSelector(selector) {
            return true
        }

        if #available(iOS 11.0, *) {
            if isDragDelegateSelector(selector)
                || isDropDelegateSelector(selector) {
                return true
            }
        }

        return false
    }

    /// Check whether the optional method  can actually be called
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method can be called
    private func checkResponds(to selector: Selector) -> Bool {
        if isDataSourceSelector(selector) {
            return checkDataSourceResponds(to: selector)
        } else if isDelegateSelector(selector) {
            return checkDelegateResponds(to: selector)
        } else if isPrefetchDataSourceSelector(selector) {
            return checkPrefetchDataSourceResponds(to: selector)
        }

        if #available(iOS 11.0, *) {
            if isDragDelegateSelector(selector) {
                return checkDragDelegateResponds(to: selector)
            } else if isDropDelegateSelector(selector) {
                return checkDropDelegateResponds(to: selector)
            }
        }

        return false
    }
}

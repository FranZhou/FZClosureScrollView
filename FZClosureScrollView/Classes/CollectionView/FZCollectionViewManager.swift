//
//  FZCollectionViewManager.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

public class FZCollectionViewManager: FZScrollViewManager {

    // MARK: - property

    /// /// The assignment will override the FZScrollViewManager's delegateDecorator property
    public var collectionViewDelegateDecorator: FZCollectionViewDelegateDecorator? {
        didSet {
            super.delegateDecorator = collectionViewDelegateDecorator
        }
    }

    public var dataSourceDecorator: FZCollectionViewDataSourceDecorator?

    public var prefetchDataSourceDecorator: FZCollectionViewPrefetchDataSourceDecorator?

    private var _dragDelegateDecorator: Any?
    @available(iOS 11.0, *)
    public var dragDelegateDecorator: FZCollectionViewDragDelegateDecorator? {
        get {
            return _dragDelegateDecorator as? FZCollectionViewDragDelegateDecorator
        }
        set {
            _dragDelegateDecorator = newValue
        }
    }

    private var _dropDelegateDecorator: Any?
    @available(iOS 11.0, *)
    public var dropDelegateDecorator: FZCollectionViewDropDelegateDecorator? {
        get {
            return _dropDelegateDecorator as? FZCollectionViewDropDelegateDecorator
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
extension FZCollectionViewManager {

    /// Whether the selector is an optional method
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional
    private func shouldCheckResponds(to selector: Selector) -> Bool {
        if isDelegateSelector(selector)
            || isDataSourceSelector(selector)
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
        if isDelegateSelector(selector) {
            return checkDelegateResponds(to: selector)
        } else if isDataSourceSelector(selector) {
            return checkDataSourceResponds(to: selector)
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

//
//  FZCollectionViewManager.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

public class FZCollectionViewManager: FZScrollViewManager {

    // MARK: - property

    public var collectionViewDelegateDecorator: FZCollectionViewDelegateDecorator?

    public var collectionViewDataSourceDecorator: FZCollectionViewDataSourceDecorator?

    public var collectionViewPrefetchDataSourceDecorator: FZCollectionViewPrefetchDataSourceDecorator?

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
        return false
    }
}

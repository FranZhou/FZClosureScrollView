//
//  FZCollectionViewManager+DelegateCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

// MARK: - enum

/// optional method in DataSource
private enum CollectionViewDelegateOptionalSelector: String, CaseIterable {

    case numberOfSections

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {

            @unknown default:
                return nil
        }
    }
}

// MARK: - check Delegate optional methods
extension FZCollectionViewManager {

    /// Whether the selector is an optional method in the Delegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  Delegate
    internal func isDelegateSelector(_ selector: Selector) -> Bool {
        return false
    }

    /// Check whether the optional method in Delegate can actually be called in Delegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in Delegate can be called
    internal func checkDelegateResponds(to selector: Selector) -> Bool {
        return false
    }
}

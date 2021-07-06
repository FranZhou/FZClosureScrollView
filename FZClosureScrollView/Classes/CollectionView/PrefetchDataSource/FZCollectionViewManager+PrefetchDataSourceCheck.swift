//
//  FZCollectionViewManager+PrefetchDataSourceCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

/// optional method in PrefetchDataSource
private enum CollectionViewPrefetchDataSourceOptionalSelector: String, CaseIterable {

    case cancelPrefetchingForItemsAtIndexPaths

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .cancelPrefetchingForItemsAtIndexPaths:
                return #selector(UICollectionViewDataSourcePrefetching.collectionView(_:cancelPrefetchingForItemsAt:))
            @unknown default:
                return nil
        }
    }
}

// MARK: - check PrefetchDataSource optional methods
extension FZCollectionViewManager {

    /// Whether the selector is an optional method in the PrefetchDataSource
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  PrefetchDataSource
    internal func isPrefetchDataSourceSelector(_ selector: Selector) -> Bool {
        guard let _ = prefetchDataSourceDecorator else {
            return false
        }
        let optionalSelector = CollectionViewPrefetchDataSourceOptionalSelector.allCases.compactMap { optionalSelector in
            return optionalSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method in PrefetchDataSource can actually be called in PrefetchDataSource
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in PrefetchDataSource can be called
    internal func checkPrefetchDataSourceResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = CollectionViewPrefetchDataSourceOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZCollectionViewManager checkPrefetchDataSourceResponds(to:) error")
        }

        guard let decorator = prefetchDataSourceDecorator else {
            fatalError("FZCollectionViewManager prefetchDataSourceDecorator is nil")
        }

        switch optionalEnum {
            case .cancelPrefetchingForItemsAtIndexPaths:
                return decorator.collectionViewCancelPrefetchingForItemsAtIndexPathsClosure != nil
            @unknown default:
                return false
        }
    }

}

//
//  FZCollectionViewManager+DataSourceCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

/// optional method in DataSource
private enum CollectionViewDataSourceOptionalSelector: String, CaseIterable {

    case numberOfSections
    case viewForSupplementaryElementOfKind
    case canMoveItemAtIndexPath
    case moveItemAtIndexPath
    case indexTitles
    case indexPathForIndexTitle

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .numberOfSections:
                return #selector(UICollectionViewDataSource.numberOfSections(in:))
            case .viewForSupplementaryElementOfKind:
                return #selector(UICollectionViewDataSource.collectionView(_:viewForSupplementaryElementOfKind:at:))
            case .canMoveItemAtIndexPath:
                return #selector(UICollectionViewDataSource.collectionView(_:canMoveItemAt:))
            case .moveItemAtIndexPath:
                return #selector(UICollectionViewDataSource.collectionView(_:moveItemAt:to:))
            case .indexTitles:
                if #available(iOS 14.0, *) {
                    return #selector(UICollectionViewDataSource.indexTitles(for:))
                } else {
                    return nil
                }
            case .indexPathForIndexTitle:
                if #available(iOS 14.0, *) {
                    return #selector(UICollectionViewDataSource.collectionView(_:indexPathForIndexTitle:at:))
                } else {
                    return nil
                }
            @unknown default:
                return nil
        }
    }
}

// MARK: - check DataSource optional methods
extension FZCollectionViewManager {

    /// Whether the selector is an optional method in the DataSource
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DataSource
    internal func isDataSourceSelector(_ selector: Selector) -> Bool {
        guard let _ = dataSourceDecorator else { 
            return false
        }
        let optionalSelector = CollectionViewDataSourceOptionalSelector.allCases.compactMap { optionalSelector in
            return optionalSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method in DataSource can actually be called in DataSource
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DataSource can be called
    internal func checkDataSourceResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = CollectionViewDataSourceOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZCollectionViewManager checkDataSourceResponds(to:) error")
        }

        guard let decorator = dataSourceDecorator else {
            fatalError("FZCollectionViewManager dataSourceDecorator is nil")
        }

        switch optionalEnum {
            case .numberOfSections:
                return decorator.collectionViewNumberOfSectionsClosure != nil
            case .viewForSupplementaryElementOfKind:
                return decorator.collectionViewViewForSupplementaryElementOfKindClosure != nil
            case .canMoveItemAtIndexPath:
                return decorator.collectionViewCanMoveItemAtIndexPathClosure != nil
            case .moveItemAtIndexPath:
                return decorator.collectionViewMoveItemAtIndexPathClosure != nil
            case .indexTitles:
                if #available(iOS 14.0, *) {
                    return decorator.collectionViewIndexTitlesClosure != nil
                } else {
                    return false
                }
            case .indexPathForIndexTitle:
                if #available(iOS 14.0, *) {
                    return decorator.collectionViewIndexPathForIndexTitleClosure != nil
                } else {
                    return false
                }
            @unknown default:
                return false
        }
    }

}

//
//  FZCollectionViewManager+DropDelegateCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

/// optional method in DropDelegate
@available(iOS 11.0, *)
private enum CollectionViewDropDelegateOptionalSelector: String, CaseIterable {

    case canHandleSession
    case dropSessionDidEnter
    case dropSessionDidUpdate
    case dropSessionDidExit
    case dropSessionDidEnd
    case dropPreviewParametersForItemAtIndexPath

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .canHandleSession:
                return #selector(UICollectionViewDropDelegate.collectionView(_:canHandle:))
            case .dropSessionDidEnter:
                return #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidEnter:))
            case .dropSessionDidUpdate:
                return #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:))
            case .dropSessionDidExit:
                return #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidExit:))
            case .dropSessionDidEnd:
                return #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidEnd:))
            case .dropPreviewParametersForItemAtIndexPath:
                return #selector(UICollectionViewDropDelegate.collectionView(_:dropPreviewParametersForItemAt:))
            @unknown default:
                return nil
        }
    }
}

// MARK: - check DropDelegate optional methods
@available(iOS 11.0, *)
extension FZCollectionViewManager {

    /// Whether the selector is an optional method in the DropDelegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DropDelegate
    internal func isDropDelegateSelector(_ selector: Selector) -> Bool {
        let optionalSelector = CollectionViewDropDelegateOptionalSelector.allCases.compactMap { optionalSelector in
            return optionalSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method in DropDelegate can actually be called in DropDelegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DropDelegate can be called
    internal func checkDropDelegateResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = CollectionViewDropDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZCollectionViewManager checkDropDelegateResponds(to:) error")
        }

        switch optionalEnum {
            case .canHandleSession:
                return dropDelegateDecorator?.collectionViewCanHandleSessionClosure != nil
            case .dropSessionDidEnter:
                return dropDelegateDecorator?.collectionViewDropSessionDidEnterClosure != nil
            case .dropSessionDidUpdate:
                return dropDelegateDecorator?.collectionViewDropSessionDidUpdateClosure != nil
            case .dropSessionDidExit:
                return dropDelegateDecorator?.collectionViewDropSessionDidExitClosure != nil
            case .dropSessionDidEnd:
                return dropDelegateDecorator?.collectionViewDropSessionDidEndClosure != nil
            case .dropPreviewParametersForItemAtIndexPath:
                return dropDelegateDecorator?.collectionViewDropPreviewParametersForItemAtIndexPathClosure != nil
            @unknown default:
                return false
        }
    }

}

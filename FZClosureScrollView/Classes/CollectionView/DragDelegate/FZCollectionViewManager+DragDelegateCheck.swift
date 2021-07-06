//
//  FZCollectionViewManager+DragDelegateCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

/// optional method in DragDelegate
@available(iOS 11.0, *)
private enum CollectionViewDragDelegateOptionalSelector: String, CaseIterable {

    case itemsForAdding
    case dragPreviewParametersForItemAtIndexPath
    case dragSessionWillBegin
    case dragSessionDidEnd
    case dragSessionAllowsMoveOperation
    case dragSessionIsRestrictedToDraggingApplication

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .itemsForAdding:
                return #selector(UICollectionViewDragDelegate.collectionView(_:itemsForAddingTo:at:point:))
            case .dragPreviewParametersForItemAtIndexPath:
                return #selector(UICollectionViewDragDelegate.collectionView(_:dragPreviewParametersForItemAt:))
            case .dragSessionWillBegin:
                return #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionWillBegin:))
            case .dragSessionDidEnd:
                return #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionDidEnd:))
            case .dragSessionAllowsMoveOperation:
                return #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionAllowsMoveOperation:))
            case .dragSessionIsRestrictedToDraggingApplication:
                return #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionIsRestrictedToDraggingApplication:))
            @unknown default:
                return nil
        }
    }
}

// MARK: - check DragDelegate optional methods
@available(iOS 11.0, *)
extension FZCollectionViewManager {

    /// Whether the selector is an optional method in the DragDelegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DragDelegate
    internal func isDragDelegateSelector(_ selector: Selector) -> Bool {
        guard let _ = dragDelegateDecorator else {
            return false
        }
        let optionalSelector = CollectionViewDragDelegateOptionalSelector.allCases.compactMap { optionalSelector in
            return optionalSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method in DragDelegate can actually be called in DragDelegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DragDelegate can be called
    internal func checkDragDelegateResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = CollectionViewDragDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZCollectionViewManager checkDragDelegateResponds(to:) error")
        }

        guard let decorator = dragDelegateDecorator else {
            fatalError("FZCollectionViewManager dragDelegateDecorator is nil")
        }

        switch optionalEnum {
            case .itemsForAdding:
                return decorator.collectionViewItemsForAddingClosure != nil
            case .dragPreviewParametersForItemAtIndexPath:
                return decorator.collectionViewDragPreviewParametersForItemAtIndexPathClosure != nil
            case .dragSessionWillBegin:
                return decorator.collectionViewDragSessionWillBeginClosure != nil
            case .dragSessionDidEnd:
                return decorator.collectionViewDragSessionDidEndClosure != nil
            case .dragSessionAllowsMoveOperation:
                return decorator.collectionViewDragSessionAllowsMoveOperationClosure != nil
            case .dragSessionIsRestrictedToDraggingApplication:
                return decorator.collectionViewDragSessionIsRestrictedToDraggingApplicationClosure != nil
            @unknown default:
                return false
        }
    }

}

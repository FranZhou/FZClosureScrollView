//
//  FZCollectionViewManager+DelegateCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

// MARK: - enum

/// optional method in Delegate
private enum CollectionViewDelegateOptionalSelector: String, CaseIterable {

    case shouldHighlightItemAtIndexPath
    case didHighlightItemAtIndexPath
    case didUnhighlightItemAtIndexPath
    case shouldSelectItemAtIndexPath
    case shouldDeselectItemAtIndexPath
    case didSelectItemAtIndexPath
    case didDeselectItemAtIndexPath
    case willDisplayCell
    case willDisplaySupplementaryView
    case didEndDisplayingCell
    case didEndDisplayingSupplementaryView
    case shouldShowMenuForItemAtIndexPath
    case canPerformAction
    case performAction
    case transitionLayoutForOldLayout
    case canFocusItemAtIndexPath
    case shouldUpdateFocusInContext
    case didUpdateFocusInContext
    case indexPathForPreferredFocusedView
    case targetIndexPathForMoveFromItemAtIndexPath
    case targetContentOffsetForProposedContentOffset
    case canEditItemAtIndexPath
    case shouldSpringLoadItemAtIndexPath
    case shouldBeginMultipleSelectionInteractionAtIndexPath
    case didBeginMultipleSelectionInteractionAtIndexPath
    case didEndMultipleSelectionInteraction
    case contextMenuConfigurationForItemAtIndexPath
    case previewForHighlightingContextMenuWithConfiguration
    case previewForDismissingContextMenuWithConfiguration
    case willPerformPreviewActionForMenu
    case willDisplayContextMenu
    case willEndContextMenuInteraction

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .shouldHighlightItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:shouldHighlightItemAt:))
            case .didHighlightItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:didHighlightItemAt:))
            case .didUnhighlightItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:didUnhighlightItemAt:))
            case .shouldSelectItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:shouldSelectItemAt:))
            case .shouldDeselectItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:shouldDeselectItemAt:))
            case .didSelectItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:didSelectItemAt:))
            case .didDeselectItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:didDeselectItemAt:))
            case .willDisplayCell:
                return #selector(UICollectionViewDelegate.collectionView(_:willDisplay:forItemAt:))
            case .willDisplaySupplementaryView:
                return #selector(UICollectionViewDelegate.collectionView(_:willDisplaySupplementaryView:forElementKind:at:))
            case .didEndDisplayingCell:
                return #selector(UICollectionViewDelegate.collectionView(_:didEndDisplaying:forItemAt:))
            case .didEndDisplayingSupplementaryView:
                return #selector(UICollectionViewDelegate.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:))
            case .shouldShowMenuForItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:shouldShowMenuForItemAt:))
            case .canPerformAction:
                return #selector(UICollectionViewDelegate.collectionView(_:canPerformAction:forItemAt:withSender:))
            case .performAction:
                return #selector(UICollectionViewDelegate.collectionView(_:performAction:forItemAt:withSender:))
            case .transitionLayoutForOldLayout:
                return #selector(UICollectionViewDelegate.collectionView(_:transitionLayoutForOldLayout:newLayout:))
            case .canFocusItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:canFocusItemAt:))
            case .shouldUpdateFocusInContext:
                return #selector(UICollectionViewDelegate.collectionView(_:shouldUpdateFocusIn:))
            case .didUpdateFocusInContext:
                return #selector(UICollectionViewDelegate.collectionView(_:didUpdateFocusIn:with:))
            case .indexPathForPreferredFocusedView:
                return #selector(UICollectionViewDelegate.indexPathForPreferredFocusedView(in:))
            case .targetIndexPathForMoveFromItemAtIndexPath:
                return #selector(UICollectionViewDelegate.collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:))
            case .targetContentOffsetForProposedContentOffset:
                return #selector(UICollectionViewDelegate.collectionView(_:targetContentOffsetForProposedContentOffset:))
            case .canEditItemAtIndexPath:
                if #available(iOS 14.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:canEditItemAt:))
                } else {
                    return nil
                }
            case .shouldSpringLoadItemAtIndexPath:
                if #available(iOS 11.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:shouldSpringLoadItemAt:with:))
                } else {
                    return nil
                }
            case .shouldBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:shouldBeginMultipleSelectionInteractionAt:))
                } else {
                    return nil
                }
            case .didBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:didBeginMultipleSelectionInteractionAt:))
                } else {
                    return nil
                }
            case .didEndMultipleSelectionInteraction:
                if #available(iOS 13.0, *) {
                    return #selector(UICollectionViewDelegate.collectionViewDidEndMultipleSelectionInteraction(_:))
                } else {
                    return nil
                }
            case .contextMenuConfigurationForItemAtIndexPath:
                if #available(iOS 13.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:contextMenuConfigurationForItemAt:point:))
                } else {
                    return nil
                }
            case .previewForHighlightingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:previewForHighlightingContextMenuWithConfiguration:))
                } else {
                    return nil
                }
            case .previewForDismissingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:previewForDismissingContextMenuWithConfiguration:))
                } else {
                    return nil
                }
            case .willPerformPreviewActionForMenu:
                if #available(iOS 13.0, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:willPerformPreviewActionForMenuWith:animator:))
                } else {
                    return nil
                }
            case .willDisplayContextMenu:
                if #available(iOS 13.2, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:willDisplayContextMenu:animator:))
                } else {
                    return nil
                }
            case .willEndContextMenuInteraction:
                if #available(iOS 13.2, *) {
                    return #selector(UICollectionViewDelegate.collectionView(_:willEndContextMenuInteraction:animator:))
                } else {
                    return nil
                }
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
        guard let _ = collectionViewDelegateDecorator else {
            return false
        }
        let optionalSelector = CollectionViewDelegateOptionalSelector.allCases.compactMap { optionalSelector in
            return optionalSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method in Delegate can actually be called in Delegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in Delegate can be called
    internal func checkDelegateResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = CollectionViewDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZCollectionViewManager checkDelegateResponds(to:) error")
        }

        guard let decorator = collectionViewDelegateDecorator else {
            fatalError("FZCollectionViewManager collectionViewDelegateDecorator is nil")
        }

        switch optionalEnum {
            case .shouldHighlightItemAtIndexPath:
                return decorator.collectionViewShouldHighlightItemAtIndexPathClosure != nil
            case .didHighlightItemAtIndexPath:
                return decorator.collectionViewDidHighlightItemAtIndexPathClosure != nil
            case .didUnhighlightItemAtIndexPath:
                return decorator.collectionViewDidUnhighlightItemAtIndexPathClosure != nil
            case .shouldSelectItemAtIndexPath:
                return decorator.collectionViewShouldSelectItemAtIndexPathClosure != nil
            case .shouldDeselectItemAtIndexPath:
                return decorator.collectionViewShouldDeselectItemAtIndexPathClosure != nil
            case .didSelectItemAtIndexPath:
                return decorator.collectionViewDidSelectItemAtIndexPathClosure != nil
            case .didDeselectItemAtIndexPath:
                return decorator.collectionViewDidDeselectItemAtIndexPathClosure != nil
            case .willDisplayCell:
                return decorator.collectionViewWillDisplayCellClosure != nil
            case .willDisplaySupplementaryView:
                return decorator.collectionViewWillDisplaySupplementaryViewClosure != nil
            case .didEndDisplayingCell:
                return decorator.collectionViewDidEndDisplayingCellClosure != nil
            case .didEndDisplayingSupplementaryView:
                return decorator.collectionViewDidEndDisplayingSupplementaryViewClosure != nil
            case .shouldShowMenuForItemAtIndexPath:
                return decorator.collectionViewShouldShowMenuForItemAtIndexPathClosure != nil
            case .canPerformAction:
                return decorator.collectionViewCanPerformActionClosure != nil
            case .performAction:
                return decorator.collectionViewPerformActionClosure != nil
            case .transitionLayoutForOldLayout:
                return decorator.collectionViewTransitionLayoutForOldLayoutClosure != nil
            case .canFocusItemAtIndexPath:
                return decorator.collectionViewCanFocusItemAtIndexPathClosure != nil
            case .shouldUpdateFocusInContext:
                return decorator.collectionViewShouldUpdateFocusInContextClosure != nil
            case .didUpdateFocusInContext:
                return decorator.collectionViewDidUpdateFocusInContextClosure != nil
            case .indexPathForPreferredFocusedView:
                return decorator.collectionViewIndexPathForPreferredFocusedViewClosure != nil
            case .targetIndexPathForMoveFromItemAtIndexPath:
                return decorator.collectionViewTargetIndexPathForMoveFromItemAtIndexPathClosure != nil
            case .targetContentOffsetForProposedContentOffset:
                return decorator.collectionViewTargetContentOffsetForProposedContentOffsetClosure != nil
            case .canEditItemAtIndexPath:
                if #available(iOS 14.0, *) {
                    return decorator.collectionViewCanEditItemAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .shouldSpringLoadItemAtIndexPath:
                if #available(iOS 11.0, *) {
                    return decorator.collectionViewShouldSpringLoadItemAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .shouldBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return decorator.collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .didBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return decorator.collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .didEndMultipleSelectionInteraction:
                if #available(iOS 13.0, *) {
                    return decorator.collectionViewDidEndMultipleSelectionInteractionClosure != nil
                } else {
                    return false
                }
            case .contextMenuConfigurationForItemAtIndexPath:
                if #available(iOS 13.0, *) {
                    return decorator.collectionViewContextMenuConfigurationForItemAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .previewForHighlightingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return decorator.collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure != nil
                } else {
                    return false
                }
            case .previewForDismissingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return decorator.collectionViewPreviewForDismissingContextMenuWithConfigurationClosure != nil
                } else {
                    return false
                }
            case .willPerformPreviewActionForMenu:
                if #available(iOS 13.0, *) {
                    return decorator.collectionViewWillPerformPreviewActionForMenuClosure != nil
                } else {
                    return false
                }
            case .willDisplayContextMenu:
                if #available(iOS 13.2, *) {
                    return decorator.collectionViewWillDisplayContextMenuClosure != nil
                } else {
                    return false
                }
            case .willEndContextMenuInteraction:
                if #available(iOS 13.2, *) {
                    return decorator.collectionViewWillEndContextMenuInteractionClosure != nil
                } else {
                    return false
                }
            @unknown default:
                return false
        }
    }
}

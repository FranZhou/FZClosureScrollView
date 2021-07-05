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

        switch optionalEnum {
            case .shouldHighlightItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewShouldHighlightItemAtIndexPathClosure != nil
            case .didHighlightItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewDidHighlightItemAtIndexPathClosure != nil
            case .didUnhighlightItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewDidUnhighlightItemAtIndexPathClosure != nil
            case .shouldSelectItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewShouldSelectItemAtIndexPathClosure != nil
            case .shouldDeselectItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewShouldDeselectItemAtIndexPathClosure != nil
            case .didSelectItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewDidSelectItemAtIndexPathClosure != nil
            case .didDeselectItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewDidDeselectItemAtIndexPathClosure != nil
            case .willDisplayCell:
                return collectionViewDelegateDecorator?.collectionViewWillDisplayCellClosure != nil
            case .willDisplaySupplementaryView:
                return collectionViewDelegateDecorator?.collectionViewWillDisplaySupplementaryViewClosure != nil
            case .didEndDisplayingCell:
                return collectionViewDelegateDecorator?.collectionViewDidEndDisplayingCellClosure != nil
            case .didEndDisplayingSupplementaryView:
                return collectionViewDelegateDecorator?.collectionViewDidEndDisplayingSupplementaryViewClosure != nil
            case .shouldShowMenuForItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewShouldShowMenuForItemAtIndexPathClosure != nil
            case .canPerformAction:
                return collectionViewDelegateDecorator?.collectionViewCanPerformActionClosure != nil
            case .performAction:
                return collectionViewDelegateDecorator?.collectionViewPerformActionClosure != nil
            case .transitionLayoutForOldLayout:
                return collectionViewDelegateDecorator?.collectionViewTransitionLayoutForOldLayoutClosure != nil
            case .canFocusItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewCanFocusItemAtIndexPathClosure != nil
            case .shouldUpdateFocusInContext:
                return collectionViewDelegateDecorator?.collectionViewShouldUpdateFocusInContextClosure != nil
            case .didUpdateFocusInContext:
                return collectionViewDelegateDecorator?.collectionViewDidUpdateFocusInContextClosure != nil
            case .indexPathForPreferredFocusedView:
                return collectionViewDelegateDecorator?.collectionViewIndexPathForPreferredFocusedViewClosure != nil
            case .targetIndexPathForMoveFromItemAtIndexPath:
                return collectionViewDelegateDecorator?.collectionViewTargetIndexPathForMoveFromItemAtIndexPathClosure != nil
            case .targetContentOffsetForProposedContentOffset:
                return collectionViewDelegateDecorator?.collectionViewTargetContentOffsetForProposedContentOffsetClosure != nil
            case .canEditItemAtIndexPath:
                if #available(iOS 14.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewCanEditItemAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .shouldSpringLoadItemAtIndexPath:
                if #available(iOS 11.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewShouldSpringLoadItemAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .shouldBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .didBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .didEndMultipleSelectionInteraction:
                if #available(iOS 13.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewDidEndMultipleSelectionInteractionClosure != nil
                } else {
                    return false
                }
            case .contextMenuConfigurationForItemAtIndexPath:
                if #available(iOS 13.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewContextMenuConfigurationForItemAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .previewForHighlightingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure != nil
                } else {
                    return false
                }
            case .previewForDismissingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewPreviewForDismissingContextMenuWithConfigurationClosure != nil
                } else {
                    return false
                }
            case .willPerformPreviewActionForMenu:
                if #available(iOS 13.0, *) {
                    return collectionViewDelegateDecorator?.collectionViewWillPerformPreviewActionForMenuClosure != nil
                } else {
                    return false
                }
            case .willDisplayContextMenu:
                if #available(iOS 13.2, *) {
                    return collectionViewDelegateDecorator?.collectionViewWillDisplayContextMenuClosure != nil
                } else {
                    return false
                }
            case .willEndContextMenuInteraction:
                if #available(iOS 13.2, *) {
                    return collectionViewDelegateDecorator?.collectionViewWillEndContextMenuInteractionClosure != nil
                } else {
                    return false
                }
            @unknown default:
                return false
        }
    }
}

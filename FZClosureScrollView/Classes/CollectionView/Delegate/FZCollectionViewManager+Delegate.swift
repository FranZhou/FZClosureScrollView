//
//  FZCollectionViewManager+Delegate.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

extension FZCollectionViewManager: UICollectionViewDelegate {

    // MARK: - optional

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewShouldHighlightItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewShouldHighlightItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidHighlightItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidHighlightItemAtIndexPathClosure should not be nil")
        }
        closure(collectionView, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidUnhighlightItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidUnhighlightItemAtIndexPathClosure should not be nil")
        }
        closure(collectionView, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewShouldSelectItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewShouldSelectItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewShouldDeselectItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewShouldDeselectItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidSelectItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidSelectItemAtIndexPathClosure should not be nil")
        }
        closure(collectionView, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidDeselectItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidDeselectItemAtIndexPathClosure should not be nil")
        }
        closure(collectionView, indexPath)
    }

    @available(iOS 8.0, *)
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewWillDisplayCellClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewWillDisplayCellClosure should not be nil")
        }
        closure(collectionView, cell, indexPath)
    }

    @available(iOS 8.0, *)
    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewWillDisplaySupplementaryViewClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewWillDisplaySupplementaryViewClosure should not be nil")
        }
        closure(collectionView, view, elementKind, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidEndDisplayingCellClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidEndDisplayingCellClosure should not be nil")
        }
        closure(collectionView, cell, indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidEndDisplayingSupplementaryViewClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidEndDisplayingSupplementaryViewClosure should not be nil")
        }
        closure(collectionView, view, elementKind, indexPath)
    }

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    public func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewShouldShowMenuForItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewShouldShowMenuForItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    public func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewCanPerformActionClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewCanPerformActionClosure should not be nil")
        }
        return closure(collectionView, action, indexPath, sender)
    }

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    public func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewPerformActionClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewPerformActionClosure should not be nil")
        }
        closure(collectionView, action, indexPath, sender)
    }

    @available(iOS 7.0, *)
    public func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        guard let closure = collectionViewDelegateDecorator?.collectionViewTransitionLayoutForOldLayoutClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewTransitionLayoutForOldLayoutClosure should not be nil")
        }
        return closure(collectionView, fromLayout, toLayout)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewCanFocusItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewCanFocusItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewShouldUpdateFocusInContextClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewShouldUpdateFocusInContextClosure should not be nil")
        }
        return closure(collectionView, context)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidUpdateFocusInContextClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidUpdateFocusInContextClosure should not be nil")
        }
        closure(collectionView, context, coordinator)
    }

    @available(iOS 9.0, *)
    public func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        guard let closure = collectionViewDelegateDecorator?.collectionViewIndexPathForPreferredFocusedViewClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewIndexPathForPreferredFocusedViewClosure should not be nil")
        }
        return closure(collectionView)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        guard let closure = collectionViewDelegateDecorator?.collectionViewTargetIndexPathForMoveFromItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewTargetIndexPathForMoveFromItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, originalIndexPath, proposedIndexPath)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        guard let closure = collectionViewDelegateDecorator?.collectionViewTargetContentOffsetForProposedContentOffsetClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewTargetContentOffsetForProposedContentOffsetClosure should not be nil")
        }
        return closure(collectionView, proposedContentOffset)
    }

    @available(iOS 14.0, *)
    public func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewCanEditItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewCanEditItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewShouldSpringLoadItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewShouldSpringLoadItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath, context)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDelegateDecorator?.collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure should not be nil")
        }
        closure(collectionView, indexPath)
    }

    @available(iOS 13.0, *)
    public func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewDidEndMultipleSelectionInteractionClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewDidEndMultipleSelectionInteractionClosure should not be nil")
        }
        closure(collectionView)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        guard let closure = collectionViewDelegateDecorator?.collectionViewContextMenuConfigurationForItemAtIndexPathClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewContextMenuConfigurationForItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath, point)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let closure = collectionViewDelegateDecorator?.collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure should not be nil")
        }
        return closure(collectionView, configuration)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let closure = collectionViewDelegateDecorator?.collectionViewPreviewForDismissingContextMenuWithConfigurationClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewPreviewForDismissingContextMenuWithConfigurationClosure should not be nil")
        }
        return closure(collectionView, configuration)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewWillPerformPreviewActionForMenuClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewWillPerformPreviewActionForMenuClosure should not be nil")
        }
        closure(collectionView, configuration, animator)
    }

    @available(iOS 13.2, *)
    public func collectionView(_ collectionView: UICollectionView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewWillDisplayContextMenuClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewWillDisplayContextMenuClosure should not be nil")
        }
        closure(collectionView, configuration, animator)
    }

    @available(iOS 13.2, *)
    public func collectionView(_ collectionView: UICollectionView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        guard let closure = collectionViewDelegateDecorator?.collectionViewWillEndContextMenuInteractionClosure else {
            fatalError("collectionViewDelegateDecorator property collectionViewWillEndContextMenuInteractionClosure should not be nil")
        }
        closure(collectionView, configuration, animator)
    }

}

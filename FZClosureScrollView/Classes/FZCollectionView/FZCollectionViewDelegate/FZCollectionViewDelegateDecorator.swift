//
//  FZCollectionViewDelegateDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

public class FZCollectionViewDelegateDecorator: FZScrollViewDelegateDecorator {

    // MARK: - typealias

    public typealias ShouldHighlightItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    public typealias DidHighlightItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void

    public typealias DidUnhighlightItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void

    public typealias ShouldSelectItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    public typealias ShouldDeselectItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    public typealias DidSelectItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void

    public typealias DidDeselectItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void

    public typealias WillDisplayCellClosure = (_ collectionView: UICollectionView, _ cell: UICollectionViewCell, _ indexPath: IndexPath) -> Void

    public typealias WillDisplaySupplementaryViewClosure = (_ collectionView: UICollectionView, _ view: UICollectionReusableView, _ elementKind: String, _ indexPath: IndexPath) -> Void

    public typealias DidEndDisplayingCellClosure = (_ collectionView: UICollectionView, _ cell: UICollectionViewCell, _ indexPath: IndexPath) -> Void

    public typealias DidEndDisplayingSupplementaryViewClosure = (_ collectionView: UICollectionView, _ view: UICollectionReusableView, _ elementKind: String, _ indexPath: IndexPath) -> Void

    public typealias ShouldShowMenuForItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    public typealias CanPerformActionClosure = (_ collectionView: UICollectionView, _ action: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Bool

    public typealias PerformActionClosure = (_ collectionView: UICollectionView, _ action: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Void

    public typealias TransitionLayoutForOldLayoutClosure = (_ collectionView: UICollectionView, _ fromLayout: UICollectionViewLayout, _ toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout

    public typealias CanFocusItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    public typealias ShouldUpdateFocusInContextClosure = (_ collectionView: UICollectionView, _ context: UICollectionViewFocusUpdateContext) -> Bool

    public typealias DidUpdateFocusInContextClosure = (_ collectionView: UICollectionView, _ context: UICollectionViewFocusUpdateContext, _ coordinator: UIFocusAnimationCoordinator) -> Void

    public typealias IndexPathForPreferredFocusedViewClosure = (_ collectionView: UICollectionView) -> IndexPath?

    public typealias TargetIndexPathForMoveFromItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ originalIndexPath: IndexPath, _ proposedIndexPath: IndexPath) -> IndexPath

    public typealias TargetContentOffsetForProposedContentOffsetClosure = (_ collectionView: UICollectionView, _ proposedContentOffset: CGPoint) -> CGPoint

    @available(iOS 14.0, *)
    public typealias CanEditItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    @available(iOS 11.0, *)
    public typealias ShouldSpringLoadItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath, _ context: UISpringLoadedInteractionContext) -> Bool

    @available(iOS 13.0, *)
    public typealias ShouldBeginMultipleSelectionInteractionAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    @available(iOS 13.0, *)
    public typealias DidBeginMultipleSelectionInteractionAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void

    @available(iOS 13.0, *)
    public typealias DidEndMultipleSelectionInteractionClosure = (_ collectionView: UICollectionView) -> Void

    @available(iOS 13.0, *)
    public typealias ContextMenuConfigurationForItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath, _ point: CGPoint) -> UIContextMenuConfiguration?

    @available(iOS 13.0, *)
    public typealias PreviewForHighlightingContextMenuWithConfigurationClosure = (_ collectionView: UICollectionView, _ configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    @available(iOS 13.0, *)
    public typealias PreviewForDismissingContextMenuWithConfigurationClosure = (_ collectionView: UICollectionView, _ configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    @available(iOS 13.0, *)
    public typealias WillPerformPreviewActionForMenuClosure = (_ collectionView: UICollectionView, _ configuration: UIContextMenuConfiguration, _ animator: UIContextMenuInteractionCommitAnimating) -> Void

    @available(iOS 13.2, *)
    public typealias WillDisplayContextMenuClosure = (_ collectionView: UICollectionView, _ configuration: UIContextMenuConfiguration, _ animator: UIContextMenuInteractionAnimating?) -> Void

    @available(iOS 13.2, *)
    public typealias WillEndContextMenuInteractionClosure = (_ collectionView: UICollectionView, _ configuration: UIContextMenuConfiguration, _ animator: UIContextMenuInteractionAnimating?) -> Void

    // MARK: - property

    public var collectionViewShouldHighlightItemAtIndexPathClosure: ShouldHighlightItemAtIndexPathClosure?

    public var collectionViewDidHighlightItemAtIndexPathClosure: DidHighlightItemAtIndexPathClosure?

    public var collectionViewDidUnhighlightItemAtIndexPathClosure: DidUnhighlightItemAtIndexPathClosure?

    public var collectionViewShouldSelectItemAtIndexPathClosure: ShouldSelectItemAtIndexPathClosure?

    public var collectionViewShouldDeselectItemAtIndexPathClosure: ShouldDeselectItemAtIndexPathClosure?

    public var collectionViewDidSelectItemAtIndexPathClosure: DidSelectItemAtIndexPathClosure?

    public var collectionViewDidDeselectItemAtIndexPathClosure: DidDeselectItemAtIndexPathClosure?

    public var collectionViewWillDisplayCellClosure: WillDisplayCellClosure?

    public var collectionViewWillDisplaySupplementaryViewClosure: WillDisplaySupplementaryViewClosure?

    public var collectionViewDidEndDisplayingCellClosure: DidEndDisplayingCellClosure?

    public var collectionViewDidEndDisplayingSupplementaryViewClosure: DidEndDisplayingSupplementaryViewClosure?

    public var collectionViewShouldShowMenuForItemAtIndexPathClosure: ShouldShowMenuForItemAtIndexPathClosure?

    public var collectionViewCanPerformActionClosure: CanPerformActionClosure?

    public var collectionViewPerformActionClosure: PerformActionClosure?

    public var collectionViewTransitionLayoutForOldLayoutClosure: TransitionLayoutForOldLayoutClosure?

    public var collectionViewCanFocusItemAtIndexPathClosure: CanFocusItemAtIndexPathClosure?

    public var collectionViewShouldUpdateFocusInContextClosure: ShouldUpdateFocusInContextClosure?

    public var collectionViewDidUpdateFocusInContextClosure: DidUpdateFocusInContextClosure?

    public var collectionViewIndexPathForPreferredFocusedViewClosure: IndexPathForPreferredFocusedViewClosure?

    public var collectionViewTargetIndexPathForMoveFromItemAtIndexPathClosure: TargetIndexPathForMoveFromItemAtIndexPathClosure?

    public var collectionViewTargetContentOffsetForProposedContentOffsetClosure: TargetContentOffsetForProposedContentOffsetClosure?

    private var _collectionViewCanEditItemAtIndexPathClosure: Any?
    @available(iOS 14.0, *)
    public var collectionViewCanEditItemAtIndexPathClosure: CanEditItemAtIndexPathClosure? {
        get {
            return _collectionViewCanEditItemAtIndexPathClosure as? CanEditItemAtIndexPathClosure
        }
        set {
            _collectionViewCanEditItemAtIndexPathClosure = newValue
        }
    }

    private var _collectionViewShouldSpringLoadItemAtIndexPathClosure: Any?
    @available(iOS 11.0, *)
    public var collectionViewShouldSpringLoadItemAtIndexPathClosure: ShouldSpringLoadItemAtIndexPathClosure? {
        get {
            return _collectionViewShouldSpringLoadItemAtIndexPathClosure as? ShouldSpringLoadItemAtIndexPathClosure
        }
        set {
            _collectionViewShouldSpringLoadItemAtIndexPathClosure = newValue
        }
    }

    private var _collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure: Any?
    @available(iOS 13.0, *)
    public var collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure: ShouldBeginMultipleSelectionInteractionAtIndexPathClosure? {
        get {
            return _collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure as? ShouldBeginMultipleSelectionInteractionAtIndexPathClosure
        }
        set {
            _collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure = newValue
        }
    }

    private var _collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure: Any?
    @available(iOS 13.0, *)
    public var collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure: DidBeginMultipleSelectionInteractionAtIndexPathClosure? {
        get {
            return _collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure as? DidBeginMultipleSelectionInteractionAtIndexPathClosure
        }
        set {
            _collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure = newValue
        }
    }

    private var _collectionViewDidEndMultipleSelectionInteractionClosure: Any?
    @available(iOS 13.0, *)
    public var collectionViewDidEndMultipleSelectionInteractionClosure: DidEndMultipleSelectionInteractionClosure? {
        get {
            return _collectionViewDidEndMultipleSelectionInteractionClosure as? DidEndMultipleSelectionInteractionClosure
        }
        set {
            _collectionViewDidEndMultipleSelectionInteractionClosure = newValue
        }
    }

    private var _collectionViewContextMenuConfigurationForItemAtIndexPathClosure: Any?
    @available(iOS 13.0, *)
    public var collectionViewContextMenuConfigurationForItemAtIndexPathClosure: ContextMenuConfigurationForItemAtIndexPathClosure? {
        get {
            return _collectionViewContextMenuConfigurationForItemAtIndexPathClosure as? ContextMenuConfigurationForItemAtIndexPathClosure
        }
        set {
            _collectionViewContextMenuConfigurationForItemAtIndexPathClosure = newValue
        }
    }

    private var _collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure: Any?
    @available(iOS 13.0, *)
    public var collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure: PreviewForHighlightingContextMenuWithConfigurationClosure? {
        get {
            return _collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure as? PreviewForHighlightingContextMenuWithConfigurationClosure
        }
        set {
            _collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure = newValue
        }
    }

    private var _collectionViewPreviewForDismissingContextMenuWithConfigurationClosure: Any?
    @available(iOS 13.0, *)
    public var collectionViewPreviewForDismissingContextMenuWithConfigurationClosure: PreviewForDismissingContextMenuWithConfigurationClosure? {
        get {
            return _collectionViewPreviewForDismissingContextMenuWithConfigurationClosure as? PreviewForDismissingContextMenuWithConfigurationClosure
        }
        set {
            _collectionViewPreviewForDismissingContextMenuWithConfigurationClosure = newValue
        }
    }

    private var _collectionViewWillPerformPreviewActionForMenuClosure: Any?
    @available(iOS 13.0, *)
    public var collectionViewWillPerformPreviewActionForMenuClosure: WillPerformPreviewActionForMenuClosure? {
        get {
            return _collectionViewWillPerformPreviewActionForMenuClosure as? WillPerformPreviewActionForMenuClosure
        }
        set {
            _collectionViewWillPerformPreviewActionForMenuClosure = newValue
        }
    }

    private var _collectionViewWillDisplayContextMenuClosure: Any?
    @available(iOS 13.2, *)
    public var collectionViewWillDisplayContextMenuClosure: WillDisplayContextMenuClosure? {
        get {
            return _collectionViewWillDisplayContextMenuClosure as? WillDisplayContextMenuClosure
        }
        set {
            _collectionViewWillDisplayContextMenuClosure = newValue
        }
    }

    private var _collectionViewWillEndContextMenuInteractionClosure: Any?
    @available(iOS 13.2, *)
    public var collectionViewWillEndContextMenuInteractionClosure: WillEndContextMenuInteractionClosure? {
        get {
            return _collectionViewWillEndContextMenuInteractionClosure as? WillEndContextMenuInteractionClosure
        }
        set {
            _collectionViewWillEndContextMenuInteractionClosure = newValue
        }
    }

}

// MARK: - Delegate 链式调用
extension FZCollectionViewDelegateDecorator {

    public func setCollectionViewShouldHighlightItemAtIndexPathClosure(_ closure: ShouldHighlightItemAtIndexPathClosure?) -> Self {
        collectionViewShouldHighlightItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewDidHighlightItemAtIndexPathClosure(_ closure: DidHighlightItemAtIndexPathClosure?) -> Self {
        collectionViewDidHighlightItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewDidUnhighlightItemAtIndexPathClosure(_ closure: DidUnhighlightItemAtIndexPathClosure?) -> Self {
        collectionViewDidUnhighlightItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewShouldSelectItemAtIndexPathClosure(_ closure: ShouldSelectItemAtIndexPathClosure?) -> Self {
        collectionViewShouldSelectItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewShouldDeselectItemAtIndexPathClosure(_ closure: ShouldDeselectItemAtIndexPathClosure?) -> Self {
        collectionViewShouldDeselectItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewDidSelectItemAtIndexPathClosure(_ closure: DidSelectItemAtIndexPathClosure?) -> Self {
        collectionViewDidSelectItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewDidDeselectItemAtIndexPathClosure(_ closure: DidDeselectItemAtIndexPathClosure?) -> Self {
        collectionViewDidDeselectItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewWillDisplayCellClosure(_ closure: WillDisplayCellClosure?) -> Self {
        collectionViewWillDisplayCellClosure = closure
        return self
    }
    public func setCollectionViewWillDisplaySupplementaryViewClosure(_ closure: WillDisplaySupplementaryViewClosure?) -> Self {
        collectionViewWillDisplaySupplementaryViewClosure = closure
        return self
    }

    public func setCollectionViewDidEndDisplayingCellClosure(_ closure: DidEndDisplayingCellClosure?) -> Self {
        collectionViewDidEndDisplayingCellClosure = closure
        return self
    }

    public func setCollectionViewDidEndDisplayingSupplementaryViewClosure(_ closure: DidEndDisplayingSupplementaryViewClosure?) -> Self {
        collectionViewDidEndDisplayingSupplementaryViewClosure = closure
        return self
    }

    public func setCollectionViewShouldShowMenuForItemAtIndexPathClosure(_ closure: ShouldShowMenuForItemAtIndexPathClosure?) -> Self {
        collectionViewShouldShowMenuForItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewCanPerformActionClosure(_ closure: CanPerformActionClosure?) -> Self {
        collectionViewCanPerformActionClosure = closure
        return self
    }

    public func setCollectionViewPerformActionClosure(_ closure: PerformActionClosure?) -> Self {
        collectionViewPerformActionClosure = closure
        return self
    }

    public func setCollectionViewTransitionLayoutForOldLayoutClosure(_ closure: TransitionLayoutForOldLayoutClosure?) -> Self {
        collectionViewTransitionLayoutForOldLayoutClosure = closure
        return self
    }

    public func setCollectionViewCanFocusItemAtIndexPathClosure(_ closure: CanFocusItemAtIndexPathClosure?) -> Self {
        collectionViewCanFocusItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewShouldUpdateFocusInContextClosure(_ closure: ShouldUpdateFocusInContextClosure?) -> Self {
        collectionViewShouldUpdateFocusInContextClosure = closure
        return self
    }

    public func setCollectionViewDidUpdateFocusInContextClosure(_ closure: DidUpdateFocusInContextClosure?) -> Self {
        collectionViewDidUpdateFocusInContextClosure = closure
        return self
    }

    public func setCollectionViewIndexPathForPreferredFocusedViewClosure(_ closure: IndexPathForPreferredFocusedViewClosure?) -> Self {
        collectionViewIndexPathForPreferredFocusedViewClosure = closure
        return self
    }

    public func setCollectionViewTargetIndexPathForMoveFromItemAtIndexPathClosure(_ closure: TargetIndexPathForMoveFromItemAtIndexPathClosure?) -> Self {
        collectionViewTargetIndexPathForMoveFromItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewTargetContentOffsetForProposedContentOffsetClosure(_ closure: TargetContentOffsetForProposedContentOffsetClosure?) -> Self {
        collectionViewTargetContentOffsetForProposedContentOffsetClosure = closure
        return self
    }

    @available(iOS 14.0, *)
    public func setCollectionViewCanEditItemAtIndexPathClosure(_ closure: CanEditItemAtIndexPathClosure?) -> Self {
        collectionViewCanEditItemAtIndexPathClosure = closure
        return self
    }

    @available(iOS 11.0, *)
    public func setCollectionViewShouldSpringLoadItemAtIndexPathClosure(_ closure: ShouldSpringLoadItemAtIndexPathClosure?) -> Self {
        collectionViewShouldSpringLoadItemAtIndexPathClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    public func setCollectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure(_ closure: ShouldBeginMultipleSelectionInteractionAtIndexPathClosure?) -> Self {
        collectionViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    public func setCollectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure(_ closure: DidBeginMultipleSelectionInteractionAtIndexPathClosure?) -> Self {
        collectionViewDidBeginMultipleSelectionInteractionAtIndexPathClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    public func setCollectionViewDidEndMultipleSelectionInteractionClosure(_ closure: DidEndMultipleSelectionInteractionClosure?) -> Self {
        collectionViewDidEndMultipleSelectionInteractionClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    public func setCollectionViewContextMenuConfigurationForItemAtIndexPathClosure(_ closure: ContextMenuConfigurationForItemAtIndexPathClosure?) -> Self {
        collectionViewContextMenuConfigurationForItemAtIndexPathClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    public func setCollectionViewPreviewForHighlightingContextMenuWithConfigurationClosure(_ closure: PreviewForHighlightingContextMenuWithConfigurationClosure?) -> Self {
        collectionViewPreviewForHighlightingContextMenuWithConfigurationClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    public func setCollectionViewPreviewForDismissingContextMenuWithConfigurationClosure(_ closure: PreviewForDismissingContextMenuWithConfigurationClosure?) -> Self {
        collectionViewPreviewForDismissingContextMenuWithConfigurationClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    public func setCollectionViewWillPerformPreviewActionForMenuClosure(_ closure: WillPerformPreviewActionForMenuClosure?) -> Self {
        collectionViewWillPerformPreviewActionForMenuClosure = closure
        return self
    }

    @available(iOS 13.2, *)
    public func setCollectionViewWillDisplayContextMenuClosure(_ closure: WillDisplayContextMenuClosure?) -> Self {
        collectionViewWillDisplayContextMenuClosure = closure
        return self
    }

    @available(iOS 13.2, *)
    public func setCollectionViewWillEndContextMenuInteractionClosure(_ closure: WillEndContextMenuInteractionClosure?) -> Self {
        collectionViewWillEndContextMenuInteractionClosure = closure
        return self
    }
}

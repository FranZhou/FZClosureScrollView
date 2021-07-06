//
//  FZCollectionViewDragDelegateDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

@available(iOS 11.0, *)
public class FZCollectionViewDragDelegateDecorator: NSObject {

    // MARK: - typealias

    public typealias ItemsForBeginningClosure = (_ collectionView: UICollectionView, _ session: UIDragSession, _ indexPath: IndexPath) -> [UIDragItem]

    public typealias ItemsForAddingClosure = (_ collectionView: UICollectionView, _ session: UIDragSession, _ indexPath: IndexPath, _ point: CGPoint) -> [UIDragItem]

    public typealias DragPreviewParametersForItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UIDragPreviewParameters?

    public typealias DragSessionWillBeginClosure = (_ collectionView: UICollectionView, _ session: UIDragSession) -> Void

    public typealias DragSessionDidEndClosure = (_ collectionView: UICollectionView, _ session: UIDragSession) -> Void

    public typealias DragSessionAllowsMoveOperationClosure = (_ collectionView: UICollectionView, _ session: UIDragSession) -> Bool

    public typealias DragSessionIsRestrictedToDraggingApplicationClosure = (_ collectionView: UICollectionView, _ session: UIDragSession) -> Bool

    // MARK: - property

    public var collectionViewItemsForBeginningClosure: ItemsForBeginningClosure?

    public var collectionViewItemsForAddingClosure: ItemsForAddingClosure?

    public var collectionViewDragPreviewParametersForItemAtIndexPathClosure: DragPreviewParametersForItemAtIndexPathClosure?

    public var collectionViewDragSessionWillBeginClosure: DragSessionWillBeginClosure?

    public var collectionViewDragSessionDidEndClosure: DragSessionDidEndClosure?

    public var collectionViewDragSessionAllowsMoveOperationClosure: DragSessionAllowsMoveOperationClosure?

    public var collectionViewDragSessionIsRestrictedToDraggingApplicationClosure: DragSessionIsRestrictedToDraggingApplicationClosure?
}

// MARK: - DragDelegate 链式调用
@available(iOS 11.0, *)
extension FZCollectionViewDragDelegateDecorator {

    @discardableResult
    public func setCollectionViewItemsForBeginningClosure(_ closure: @escaping ItemsForBeginningClosure) -> Self {
        collectionViewItemsForBeginningClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewItemsForAddingClosure(_ closure: ItemsForAddingClosure?) -> Self {
        collectionViewItemsForAddingClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDragPreviewParametersForItemAtIndexPathClosure(_ closure: DragPreviewParametersForItemAtIndexPathClosure?) -> Self {
        collectionViewDragPreviewParametersForItemAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDragSessionWillBeginClosure(_ closure: DragSessionWillBeginClosure?) -> Self {
        collectionViewDragSessionWillBeginClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDragSessionDidEndClosure(_ closure: DragSessionDidEndClosure?) -> Self {
        collectionViewDragSessionDidEndClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDragSessionAllowsMoveOperationClosure(_ closure: DragSessionAllowsMoveOperationClosure?) -> Self {
        collectionViewDragSessionAllowsMoveOperationClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDragSessionIsRestrictedToDraggingApplicationClosure(_ closure: DragSessionIsRestrictedToDraggingApplicationClosure?) -> Self {
        collectionViewDragSessionIsRestrictedToDraggingApplicationClosure = closure
        return self
    }
}

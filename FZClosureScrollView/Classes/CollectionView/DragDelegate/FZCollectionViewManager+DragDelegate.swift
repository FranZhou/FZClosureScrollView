//
//  FZCollectionViewManager+DragDelegate.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

@available(iOS 11.0, *)
extension FZCollectionViewManager: UICollectionViewDragDelegate {

    // MARK: - required

    public func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        guard let closure = dragDelegateDecorator?.collectionViewItemsForBeginningClosure else {
            fatalError("dragDelegateDecorator property collectionViewItemsForBeginningClosure should not be nil")
        }
        return closure(collectionView, session, indexPath)
    }

    // MARK: - optional

    public func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        guard let closure = dragDelegateDecorator?.collectionViewItemsForAddingClosure else {
            fatalError("dragDelegateDecorator property collectionViewItemsForAddingClosure should not be nil")
        }
        return closure(collectionView, session, indexPath, point)
    }

    public func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        guard let closure = dragDelegateDecorator?.collectionViewDragPreviewParametersForItemAtIndexPathClosure else {
            fatalError("dragDelegateDecorator property collectionViewDragPreviewParametersForItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession) {
        guard let closure = dragDelegateDecorator?.collectionViewDragSessionWillBeginClosure else {
            fatalError("dragDelegateDecorator property collectionViewDragSessionWillBeginClosure should not be nil")
        }
        closure(collectionView, session)
    }

    public func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
        guard let closure = dragDelegateDecorator?.collectionViewDragSessionDidEndClosure else {
            fatalError("dragDelegateDecorator property collectionViewDragSessionDidEndClosure should not be nil")
        }
        closure(collectionView, session)
    }

    public func collectionView(_ collectionView: UICollectionView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool {
        guard let closure = dragDelegateDecorator?.collectionViewDragSessionAllowsMoveOperationClosure else {
            fatalError("dragDelegateDecorator property collectionViewDragSessionAllowsMoveOperationClosure should not be nil")
        }
        return closure(collectionView, session)
    }

    public func collectionView(_ collectionView: UICollectionView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        guard let closure = dragDelegateDecorator?.collectionViewDragSessionIsRestrictedToDraggingApplicationClosure else {
            fatalError("dragDelegateDecorator property collectionViewDragSessionIsRestrictedToDraggingApplicationClosure should not be nil")
        }
        return closure(collectionView, session)
    }

}

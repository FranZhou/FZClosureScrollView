//
//  FZCollectionViewManager+DropDelegate.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

@available(iOS 11.0, *)
extension FZCollectionViewManager: UICollectionViewDropDelegate {

    // MARK: - required

    public func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let closure = dropDelegateDecorator?.collectionViewPerformDropWithCoordinatorClosure else {
            fatalError("dropDelegateDecorator property collectionViewPerformDropWithCoordinatorClosure should not be nil")
        }
        closure(collectionView, coordinator)
    }

    // MARK: - optional

    public func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        guard let closure = dropDelegateDecorator?.collectionViewCanHandleSessionClosure else {
            fatalError("dropDelegateDecorator property collectionViewCanHandleSessionClosure should not be nil")
        }
        return closure(collectionView, session)
    }

    public func collectionView(_ collectionView: UICollectionView, dropSessionDidEnter session: UIDropSession) {
        guard let closure = dropDelegateDecorator?.collectionViewDropSessionDidEnterClosure else {
            fatalError("dropDelegateDecorator property collectionViewDropSessionDidEnterClosure should not be nil")
        }
        closure(collectionView, session)
    }

    public func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        guard let closure = dropDelegateDecorator?.collectionViewDropSessionDidUpdateClosure else {
            fatalError("dropDelegateDecorator property collectionViewDropSessionDidUpdateClosure should not be nil")
        }
        return closure(collectionView, session, destinationIndexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, dropSessionDidExit session: UIDropSession) {
        guard let closure = dropDelegateDecorator?.collectionViewDropSessionDidExitClosure else {
            fatalError("dropDelegateDecorator property collectionViewDropSessionDidExitClosure should not be nil")
        }
        closure(collectionView, session)
    }

    public func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: UIDropSession) {
        guard let closure = dropDelegateDecorator?.collectionViewDropSessionDidEndClosure else {
            fatalError("dropDelegateDecorator property collectionViewDropSessionDidEndClosure should not be nil")
        }
        closure(collectionView, session)
    }

    public func collectionView(_ collectionView: UICollectionView, dropPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        guard let closure = dropDelegateDecorator?.collectionViewDropPreviewParametersForItemAtIndexPathClosure else {
            fatalError("dropDelegateDecorator property collectionViewDropPreviewParametersForItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }
}

//
//  FZCollectionViewDropDelegateDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

@available(iOS 11.0, *)
public class FZCollectionViewDropDelegateDecorator: NSObject {

    // MARK: - typealias

    public typealias PerformDropWithCoordinatorClosure = (_ collectionView: UICollectionView, _ coordinator: UICollectionViewDropCoordinator) -> Void

    public typealias CanHandleSessionClosure = (_ collectionView: UICollectionView, _ session: UIDropSession) -> Bool

    public typealias DropSessionDidEnterClosure = (_ collectionView: UICollectionView, _ session: UIDropSession) -> Void

    public typealias DropSessionDidUpdateClosure = (_ collectionView: UICollectionView, _ session: UIDropSession, _ destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal

    public typealias DropSessionDidExitClosure = (_ collectionView: UICollectionView, _ session: UIDropSession) -> Void

    public typealias DropSessionDidEndClosure = (_ collectionView: UICollectionView, _ session: UIDropSession) -> Void

    public typealias DropPreviewParametersForItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UIDragPreviewParameters?

    // MARK: - property

    public var collectionViewPerformDropWithCoordinatorClosure: PerformDropWithCoordinatorClosure?

    public var collectionViewCanHandleSessionClosure: CanHandleSessionClosure?

    public var collectionViewDropSessionDidEnterClosure: DropSessionDidEnterClosure?

    public var collectionViewDropSessionDidUpdateClosure: DropSessionDidUpdateClosure?

    public var collectionViewDropSessionDidExitClosure: DropSessionDidExitClosure?

    public var collectionViewDropSessionDidEndClosure: DropSessionDidEndClosure?

    public var collectionViewDropPreviewParametersForItemAtIndexPathClosure: DropPreviewParametersForItemAtIndexPathClosure?
}

// MARK: - DropDelegate 链式调用
@available(iOS 11.0, *)
extension FZCollectionViewDropDelegateDecorator {

    @discardableResult
    public func setCollectionViewPerformDropWithCoordinatorClosure(_ closure: @escaping PerformDropWithCoordinatorClosure) -> Self {
        collectionViewPerformDropWithCoordinatorClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewCanHandleSessionClosure(_ closure: CanHandleSessionClosure?) -> Self {
        collectionViewCanHandleSessionClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDropSessionDidEnterClosure(_ closure: DropSessionDidEnterClosure?) -> Self {
        collectionViewDropSessionDidEnterClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDropSessionDidUpdateClosure(_ closure: DropSessionDidUpdateClosure?) -> Self {
        collectionViewDropSessionDidUpdateClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDropSessionDidExitClosure(_ closure: DropSessionDidExitClosure?) -> Self {
        collectionViewDropSessionDidExitClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDropSessionDidEndClosure(_ closure: DropSessionDidEndClosure?) -> Self {
        collectionViewDropSessionDidEndClosure = closure
        return self
    }

    @discardableResult
    public func setCollectionViewDropPreviewParametersForItemAtIndexPathClosure(_ closure: DropPreviewParametersForItemAtIndexPathClosure?) -> Self {
        collectionViewDropPreviewParametersForItemAtIndexPathClosure = closure
        return self
    }
}

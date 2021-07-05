//
//  FZCollectionViewDataSourceDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

public class FZCollectionViewDataSourceDecorator: NSObject {

    // MARK: - typealias

    public typealias NumberOfItemsInSectionClosure = (_ collectionView: UICollectionView, _ section: Int) -> Int

    public typealias CellForItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell

    public typealias NumberOfSectionsClosure = (_ collectionView: UICollectionView) -> Int

    public typealias ViewForSupplementaryElementOfKindClosure = (_ collectionView: UICollectionView, _ kind: String, _ indexPath: IndexPath) -> UICollectionReusableView

    public typealias CanMoveItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool

    public typealias MoveItemAtIndexPathClosure = (_ collectionView: UICollectionView, _ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) -> Void

    @available(iOS 14.0, *)
    public typealias IndexTitlesClosure = (_ collectionView: UICollectionView) -> [String]?

    @available(iOS 14.0, *)
    public typealias IndexPathForIndexTitleClosure = (_ collectionView: UICollectionView, _ title: String, _ index: Int) -> IndexPath

    // MARK: - property

    public var collectionViewNumberOfItemsInSectionClosure: NumberOfItemsInSectionClosure?

    public var collectionViewCellForItemAtIndexPathClosure: CellForItemAtIndexPathClosure?

    public var collectionViewNumberOfSectionsClosure: NumberOfSectionsClosure?

    public var collectionViewViewForSupplementaryElementOfKindClosure: ViewForSupplementaryElementOfKindClosure?

    public var collectionViewCanMoveItemAtIndexPathClosure: CanMoveItemAtIndexPathClosure?

    public var collectionViewMoveItemAtIndexPathClosure: MoveItemAtIndexPathClosure?

    private var _collectionViewIndexTitlesClosure: Any?
    @available(iOS 14.0, *)
    public var collectionViewIndexTitlesClosure: IndexTitlesClosure? {
        get {
            return _collectionViewIndexTitlesClosure as? IndexTitlesClosure
        }
        set {
            _collectionViewIndexTitlesClosure = newValue
        }
    }

    private var _collectionViewIndexPathForIndexTitleClosure: Any?
    @available(iOS 14.0, *)
    public var collectionViewIndexPathForIndexTitleClosure: IndexPathForIndexTitleClosure? {
        get {
            return _collectionViewIndexPathForIndexTitleClosure as? IndexPathForIndexTitleClosure
        }
        set {
            _collectionViewIndexPathForIndexTitleClosure = newValue
        }
    }

}

// MARK: - DataSource 链式调用
extension FZCollectionViewDataSourceDecorator {

    public func setCollectionViewNumberOfItemsInSectionClosure(_ closure: @escaping NumberOfItemsInSectionClosure) -> Self {
        collectionViewNumberOfItemsInSectionClosure = closure
        return self
    }

    public func setCollectionViewCellForItemAtIndexPathClosure(_ closure: @escaping CellForItemAtIndexPathClosure) -> Self {
        collectionViewCellForItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewNumberOfSectionsClosure(_ closure: NumberOfSectionsClosure?) -> Self {
        collectionViewNumberOfSectionsClosure = closure
        return self
    }

    public func setCollectionViewViewForSupplementaryElementOfKindClosure(_ closure: ViewForSupplementaryElementOfKindClosure?) -> Self {
        collectionViewViewForSupplementaryElementOfKindClosure = closure
        return self
    }

    public func setCollectionViewCanMoveItemAtIndexPathClosure(_ closure: CanMoveItemAtIndexPathClosure?) -> Self {
        collectionViewCanMoveItemAtIndexPathClosure = closure
        return self
    }

    public func setCollectionViewMoveItemAtIndexPathClosure(_ closure: MoveItemAtIndexPathClosure?) -> Self {
        collectionViewMoveItemAtIndexPathClosure = closure
        return self
    }

    @available(iOS 14.0, *)
    public func setCollectionViewIndexTitlesClosure(_ closure: IndexTitlesClosure?) -> Self {
        collectionViewIndexTitlesClosure = closure
        return self
    }

    @available(iOS 14.0, *)
    public func setCollectionViewIndexPathForIndexTitleClosure(_ closure: IndexPathForIndexTitleClosure?) -> Self {
        collectionViewIndexPathForIndexTitleClosure = closure
        return self
    }

}

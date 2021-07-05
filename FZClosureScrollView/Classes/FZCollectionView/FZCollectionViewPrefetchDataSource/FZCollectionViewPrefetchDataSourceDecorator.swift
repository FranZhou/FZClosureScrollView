//
//  FZCollectionViewPrefetchDataSourceDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

public class FZCollectionViewPrefetchDataSourceDecorator: NSObject {

    // MARK: - typealias

    public typealias PrefetchItemsAtIndexPathsClosure = (_ collectionView: UICollectionView, _ indexPaths: [IndexPath]) -> Void

    public typealias CancelPrefetchingForItemsAtIndexPathsClosure = (_ collectionView: UICollectionView, _ indexPaths: [IndexPath]) -> Void

    // MARK: - property

    public var collectionViewPrefetchItemsAtIndexPathsClosure: PrefetchItemsAtIndexPathsClosure?

    public var collectionViewCancelPrefetchingForItemsAtIndexPathsClosure: CancelPrefetchingForItemsAtIndexPathsClosure?

}

// MARK: - PrefetchDataSource 链式调用
extension FZCollectionViewPrefetchDataSourceDecorator {

    public func setCollectionViewPrefetchItemsAtIndexPathsClosure(_ closure: @escaping PrefetchItemsAtIndexPathsClosure) -> Self {
        collectionViewPrefetchItemsAtIndexPathsClosure = closure
        return self
    }

    public func setCollectionViewCancelPrefetchingForItemsAtIndexPathsClosure(_ closure: CancelPrefetchingForItemsAtIndexPathsClosure?) -> Self {
        collectionViewCancelPrefetchingForItemsAtIndexPathsClosure = closure
        return self
    }

}

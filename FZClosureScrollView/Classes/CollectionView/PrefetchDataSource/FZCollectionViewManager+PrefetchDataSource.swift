//
//  FZCollectionViewManager+PrefetchDataSource.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import Foundation

extension FZCollectionViewManager: UICollectionViewDataSourcePrefetching {

    // MARK: required

    @available(iOS 10.0, *)
    public func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let closure = prefetchDataSourceDecorator?.collectionViewPrefetchItemsAtIndexPathsClosure else {
            fatalError("prefetchDataSourceDecorator property collectionViewPrefetchItemsAtIndexPathsClosure should not be nil")
        }
        closure(collectionView, indexPaths)
    }

    // MARK: optional

    @available(iOS 10.0, *)
    public func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        guard let closure = prefetchDataSourceDecorator?.collectionViewCancelPrefetchingForItemsAtIndexPathsClosure else {
            fatalError("prefetchDataSourceDecorator property collectionViewCancelPrefetchingForItemsAtIndexPathsClosure should not be nil")
        }
        closure(collectionView, indexPaths)
    }

}

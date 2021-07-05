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
    public func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath])

    // MARK: optional

    @available(iOS 10.0, *)
    public func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath])

}

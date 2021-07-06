//
//  FZCollectionViewManager+DataSource.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/5.
//

import UIKit

extension FZCollectionViewManager: UICollectionViewDataSource {

    // MARK: required

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let closure = dataSourceDecorator?.collectionViewNumberOfItemsInSectionClosure else {
            fatalError("dataSourceDecorator property collectionViewNumberOfItemsInSectionClosure should not be nil")
        }
        return closure(collectionView, section)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let closure = dataSourceDecorator?.collectionViewCellForItemAtIndexPathClosure else {
            fatalError("dataSourceDecorator property collectionViewCellForItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    // MARK: - optional

    @available(iOS 6.0, *)
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let closure = dataSourceDecorator?.collectionViewNumberOfSectionsClosure else {
            fatalError("dataSourceDecorator property collectionViewNumberOfSectionsClosure should not be nil")
        }
        return closure(collectionView)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let closure = dataSourceDecorator?.collectionViewViewForSupplementaryElementOfKindClosure else {
            fatalError("dataSourceDecorator property collectionViewViewForSupplementaryElementOfKindClosure should not be nil")
        }
        return closure(collectionView, kind, indexPath)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        guard let closure = dataSourceDecorator?.collectionViewCanMoveItemAtIndexPathClosure else {
            fatalError("dataSourceDecorator property collectionViewCanMoveItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let closure = dataSourceDecorator?.collectionViewMoveItemAtIndexPathClosure else {
            fatalError("dataSourceDecorator property collectionViewMoveItemAtIndexPathClosure should not be nil")
        }
        closure(collectionView, sourceIndexPath, destinationIndexPath)
    }

    @available(iOS 14.0, *)
    public func indexTitles(for collectionView: UICollectionView) -> [String]? {
        guard let closure = dataSourceDecorator?.collectionViewIndexTitlesClosure else {
            fatalError("dataSourceDecorator property collectionViewIndexTitlesClosure should not be nil")
        }
        return closure(collectionView)
    }

    @available(iOS 14.0, *)
    public func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        guard let closure = dataSourceDecorator?.collectionViewIndexPathForIndexTitleClosure else {
            fatalError("dataSourceDecorator property collectionViewIndexPathForIndexTitleClosure should not be nil")
        }
        return closure(collectionView, title, index)
    }

}

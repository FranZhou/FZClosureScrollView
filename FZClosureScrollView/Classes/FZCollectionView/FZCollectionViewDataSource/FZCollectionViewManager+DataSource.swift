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
        guard let closure = collectionViewDataSourceDecorator?.collectionViewNumberOfItemsInSectionClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewNumberOfItemsInSectionClosure should not be nil")
        }
        return closure(collectionView, section)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let closure = collectionViewDataSourceDecorator?.collectionViewCellForItemAtIndexPathClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewCellForItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    // MARK: - optional

    @available(iOS 6.0, *)
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let closure = collectionViewDataSourceDecorator?.collectionViewNumberOfSectionsClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewNumberOfSectionsClosure should not be nil")
        }
        return closure(collectionView)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let closure = collectionViewDataSourceDecorator?.collectionViewViewForSupplementaryElementOfKindClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewViewForSupplementaryElementOfKindClosure should not be nil")
        }
        return closure(collectionView, kind, indexPath)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        guard let closure = collectionViewDataSourceDecorator?.collectionViewCanMoveItemAtIndexPathClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewCanMoveItemAtIndexPathClosure should not be nil")
        }
        return closure(collectionView, indexPath)
    }

    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let closure = collectionViewDataSourceDecorator?.collectionViewMoveItemAtIndexPathClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewMoveItemAtIndexPathClosure should not be nil")
        }
        closure(collectionView, sourceIndexPath, destinationIndexPath)
    }

    @available(iOS 14.0, *)
    public func indexTitles(for collectionView: UICollectionView) -> [String]? {
        guard let closure = collectionViewDataSourceDecorator?.collectionViewIndexTitlesClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewIndexTitlesClosure should not be nil")
        }
        return closure(collectionView)
    }

    @available(iOS 14.0, *)
    public func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        guard let closure = collectionViewDataSourceDecorator?.collectionViewIndexPathForIndexTitleClosure else {
            fatalError("collectionViewDataSourceDecorator property collectionViewIndexPathForIndexTitleClosure should not be nil")
        }
        return closure(collectionView, title, index)
    }

}

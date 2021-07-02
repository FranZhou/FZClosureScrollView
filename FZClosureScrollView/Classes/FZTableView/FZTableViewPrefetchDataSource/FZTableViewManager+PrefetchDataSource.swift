//
//  FZTableViewManager+PrefetchDataSource.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

extension FZTableViewManager: UITableViewDataSourcePrefetching {

    // MARK: - required

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let closure = tableViewPrefetchDataSourceDecorator?.tableViewPrefetchRowsAtIndexPathClosure else {
            fatalError("tableViewPrefetchDataSourceDecorator property tableViewPrefetchRowsAtIndexPathClosure should not be nil")
        }
        closure(tableView, indexPaths)
    }

    // MARK: - optional

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        guard let closure = tableViewPrefetchDataSourceDecorator?.tableViewCancelPrefetchingForRowsAtIndexPathsClosure else {
            fatalError("tableViewPrefetchDataSourceDecorator property tableViewCancelPrefetchingForRowsAtIndexPathsClosure should not be nil")
        }
        closure(tableView, indexPaths)
    }

}

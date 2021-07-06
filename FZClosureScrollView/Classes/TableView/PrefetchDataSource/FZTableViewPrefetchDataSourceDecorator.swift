//
//  FZTableViewPrefetchDataSourceDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

public class FZTableViewPrefetchDataSourceDecorator: NSObject {

    // MARK: - typealias
    public typealias PrefetchRowsAtIndexPathClosure = (_ tableView: UITableView, _ indexPaths: [IndexPath]) -> Void

    public typealias CancelPrefetchingForRowsAtIndexPathsClosure = (_ tableView: UITableView, _ indexPaths: [IndexPath]) -> Void

    // MARK: - property

    public var tableViewPrefetchRowsAtIndexPathClosure: PrefetchRowsAtIndexPathClosure?

    public var tableViewCancelPrefetchingForRowsAtIndexPathsClosure: CancelPrefetchingForRowsAtIndexPathsClosure?

}

// MARK: - prefetchDataSource 链式调用
extension FZTableViewPrefetchDataSourceDecorator {

    @discardableResult
    public func setTableViewPrefetchRowsAtIndexPathClosure(_ closure: @escaping PrefetchRowsAtIndexPathClosure) -> Self {
        tableViewPrefetchRowsAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewCancelPrefetchingForRowsAtIndexPathsClosure(_ closure: CancelPrefetchingForRowsAtIndexPathsClosure?) -> Self {
        tableViewCancelPrefetchingForRowsAtIndexPathsClosure = closure
        return self
    }

}

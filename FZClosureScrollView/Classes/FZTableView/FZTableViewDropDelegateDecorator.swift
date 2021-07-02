//
//  FZTableViewDropDelegateDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

@available(iOS 11.0, *)
public class FZTableViewDropDelegateDecorator: NSObject {

    // MARK: - typealias

    public typealias PerformDropWithCoordinatorClosure = (_ tableView: UITableView, _ coordinator: UITableViewDropCoordinator) -> Void

    public typealias CanHandleSessionClosure = (_ tableView: UITableView, _ session: UIDropSession) -> Bool

    public typealias DropSessionDidEnterClosure = (_ tableView: UITableView, _ session: UIDropSession) -> Void

    public typealias DropSessionDidUpdateClosure = (_ tableView: UITableView, _ session: UIDropSession, _ destinationIndexPath: IndexPath?) -> UITableViewDropProposal

    public typealias DropSessionDidExitClosure = (_ tableView: UITableView, _ session: UIDropSession) -> Void

    public typealias DropSessionDidEndClosure = (_ tableView: UITableView, _ session: UIDropSession) -> Void

    public typealias DropPreviewParametersForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> UIDragPreviewParameters?

    // MARK: - property

    public var tableViewPerformDropWithCoordinatorClosure: PerformDropWithCoordinatorClosure?

    public var tableViewCanHandleSessionClosure: CanHandleSessionClosure?

    public var tableViewDropSessionDidEnterClosure: DropSessionDidEnterClosure?

    public var tableViewDropSessionDidUpdateClosure: DropSessionDidUpdateClosure?

    public var tableViewDropSessionDidExitClosure: DropSessionDidExitClosure?

    public var tableViewDropSessionDidEndClosure: DropSessionDidEndClosure?

    public var tableViewDropPreviewParametersForRowAtIndexPathClosure: DropPreviewParametersForRowAtIndexPathClosure?

}

// MARK: - DropDelegate 链式调用
@available(iOS 11.0, *)
extension FZTableViewDropDelegateDecorator {

    public func setTableViewPerformDropWithCoordinatorClosure(_ closure: @escaping PerformDropWithCoordinatorClosure) -> Self {
        tableViewPerformDropWithCoordinatorClosure = closure
        return self
    }

    public func setTableViewCanHandleSessionClosure(_ closure: CanHandleSessionClosure?) -> Self {
        tableViewCanHandleSessionClosure = closure
        return self
    }

    public func setTableViewDropSessionDidEnterClosure(_ closure: DropSessionDidEnterClosure?) -> Self {
        tableViewDropSessionDidEnterClosure = closure
        return self
    }

    public func setTableViewDropSessionDidUpdateClosure(_ closure: DropSessionDidUpdateClosure?) -> Self {
        tableViewDropSessionDidUpdateClosure = closure
        return self
    }

    public func setTableViewDropSessionDidExitClosure(_ closure: DropSessionDidExitClosure?) -> Self {
        tableViewDropSessionDidExitClosure = closure
        return self
    }

    public func setTableViewDropSessionDidEndClosure(_ closure: DropSessionDidEndClosure?) -> Self {
        tableViewDropSessionDidEndClosure = closure
        return self
    }

    public func setTableViewDropPreviewParametersForRowAtIndexPathClosure(_ closure: DropPreviewParametersForRowAtIndexPathClosure?) -> Self {
        tableViewDropPreviewParametersForRowAtIndexPathClosure = closure
        return self
    }

}

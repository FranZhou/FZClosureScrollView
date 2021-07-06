//
//  FZTableViewManager+DropDelegate.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

@available(iOS 11.0, *)
extension FZTableViewManager: UITableViewDropDelegate {

    // MARK: - required

    public func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        guard let closure = dropDelegateDecorator?.tableViewPerformDropWithCoordinatorClosure else {
            fatalError("dropDelegateDecorator property tableViewPerformDropWithCoordinatorClosure should not be nil")
        }
        closure(tableView, coordinator)
    }

    // MARK: - optional

    public func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        guard let closure = dropDelegateDecorator?.tableViewCanHandleSessionClosure else {
            fatalError("dropDelegateDecorator property tableViewCanHandleSessionClosure should not be nil")
        }
        return closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidEnter session: UIDropSession) {
        guard let closure = dropDelegateDecorator?.tableViewDropSessionDidEnterClosure else {
            fatalError("dropDelegateDecorator property tableViewDropSessionDidEnterClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        guard let closure = dropDelegateDecorator?.tableViewDropSessionDidUpdateClosure else {
            fatalError("dropDelegateDecorator property tableViewDropSessionDidUpdateClosure should not be nil")
        }
        return closure(tableView, session, destinationIndexPath)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidExit session: UIDropSession) {
        guard let closure = dropDelegateDecorator?.tableViewDropSessionDidExitClosure else {
            fatalError("dropDelegateDecorator property tableViewDropSessionDidExitClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidEnd session: UIDropSession) {
        guard let closure = dropDelegateDecorator?.tableViewDropSessionDidEndClosure else {
            fatalError("dropDelegateDecorator property tableViewDropSessionDidEndClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        guard let closure = dropDelegateDecorator?.tableViewDropPreviewParametersForRowAtIndexPathClosure else {
            fatalError("dropDelegateDecorator property tableViewDropPreviewParametersForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

}

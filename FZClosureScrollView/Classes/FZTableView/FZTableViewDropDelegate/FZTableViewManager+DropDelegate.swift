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
        guard let closure = tableViewDropDelegateDecorator?.tableViewPerformDropWithCoordinatorClosure else {
            fatalError("tableViewDropDelegateDecorator property tableViewPerformDropWithCoordinatorClosure should not be nil")
        }
        closure(tableView, coordinator)
    }

    // MARK: - optional

    public func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        guard let closure = tableViewDropDelegateDecorator?.tableViewCanHandleSessionClosure else {
            fatalError("tableViewDropDelegateDecorator property tableViewCanHandleSessionClosure should not be nil")
        }
        return closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidEnter session: UIDropSession) {
        guard let closure = tableViewDropDelegateDecorator?.tableViewDropSessionDidEnterClosure else {
            fatalError("tableViewDropDelegateDecorator property tableViewDropSessionDidEnterClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        guard let closure = tableViewDropDelegateDecorator?.tableViewDropSessionDidUpdateClosure else {
            fatalError("tableViewDropDelegateDecorator property tableViewDropSessionDidUpdateClosure should not be nil")
        }
        return closure(tableView, session, destinationIndexPath)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidExit session: UIDropSession) {
        guard let closure = tableViewDropDelegateDecorator?.tableViewDropSessionDidExitClosure else {
            fatalError("tableViewDropDelegateDecorator property tableViewDropSessionDidExitClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropSessionDidEnd session: UIDropSession) {
        guard let closure = tableViewDropDelegateDecorator?.tableViewDropSessionDidEndClosure else {
            fatalError("tableViewDropDelegateDecorator property tableViewDropSessionDidEndClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dropPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        guard let closure = tableViewDropDelegateDecorator?.tableViewDropPreviewParametersForRowAtIndexPathClosure else {
            fatalError("tableViewDropDelegateDecorator property tableViewDropPreviewParametersForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

}

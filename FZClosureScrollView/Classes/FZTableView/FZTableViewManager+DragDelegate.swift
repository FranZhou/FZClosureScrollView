//
//  FZTableViewManager+DragDelegate.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

@available(iOS 11.0, *)
extension FZTableViewManager: UITableViewDragDelegate {

    // MARK: - required

    public func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        guard let closure = tableViewDragDelegateDecorator?.tableViewItemsForBeginningClosure else {
            fatalError("tableViewDragDelegateDecorator property tableViewItemsForBeginningClosure should not be nil")
        }
        return closure(tableView, session, indexPath)
    }

    // MARK: - optional

    public func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        guard let closure = tableViewDragDelegateDecorator?.tableViewItemsForAddingClosure else {
            fatalError("tableViewDragDelegateDecorator property tableViewItemsForAddingClosure should not be nil")
        }
        return closure(tableView, session, indexPath, point)
    }

    public func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        guard let closure = tableViewDragDelegateDecorator?.tableViewDragPreviewParametersForRowAtIndexPathClosure else {
            fatalError("tableViewDragDelegateDecorator property tableViewDragPreviewParametersForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    public func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
        guard let closure = tableViewDragDelegateDecorator?.tableViewDragSessionWillBeginClosure else {
            fatalError("tableViewDragDelegateDecorator property tableViewDragSessionWillBeginClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        guard let closure = tableViewDragDelegateDecorator?.tableViewDragSessionDidEndClosure else {
            fatalError("tableViewDragDelegateDecorator property tableViewDragSessionDidEndClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool {
        guard let closure = tableViewDragDelegateDecorator?.tableViewDragSessionAllowsMoveOperationClosure else {
            fatalError("tableViewDragDelegateDecorator property tableViewDragSessionAllowsMoveOperationClosure should not be nil")
        }
        return closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        guard let closure = tableViewDragDelegateDecorator?.tableViewDragSessionIsRestrictedToDraggingApplicationClosure else {
            fatalError("tableViewDragDelegateDecorator property tableViewDragSessionIsRestrictedToDraggingApplicationClosure should not be nil")
        }
        return closure(tableView, session)
    }

}

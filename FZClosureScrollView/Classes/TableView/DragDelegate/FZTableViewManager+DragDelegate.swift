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
        guard let closure = dragDelegateDecorator?.tableViewItemsForBeginningClosure else {
            fatalError("dragDelegateDecorator property tableViewItemsForBeginningClosure should not be nil")
        }
        return closure(tableView, session, indexPath)
    }

    // MARK: - optional

    public func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        guard let closure = dragDelegateDecorator?.tableViewItemsForAddingClosure else {
            fatalError("dragDelegateDecorator property tableViewItemsForAddingClosure should not be nil")
        }
        return closure(tableView, session, indexPath, point)
    }

    public func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        guard let closure = dragDelegateDecorator?.tableViewDragPreviewParametersForRowAtIndexPathClosure else {
            fatalError("dragDelegateDecorator property tableViewDragPreviewParametersForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    public func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
        guard let closure = dragDelegateDecorator?.tableViewDragSessionWillBeginClosure else {
            fatalError("dragDelegateDecorator property tableViewDragSessionWillBeginClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        guard let closure = dragDelegateDecorator?.tableViewDragSessionDidEndClosure else {
            fatalError("dragDelegateDecorator property tableViewDragSessionDidEndClosure should not be nil")
        }
        closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool {
        guard let closure = dragDelegateDecorator?.tableViewDragSessionAllowsMoveOperationClosure else {
            fatalError("dragDelegateDecorator property tableViewDragSessionAllowsMoveOperationClosure should not be nil")
        }
        return closure(tableView, session)
    }

    public func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        guard let closure = dragDelegateDecorator?.tableViewDragSessionIsRestrictedToDraggingApplicationClosure else {
            fatalError("dragDelegateDecorator property tableViewDragSessionIsRestrictedToDraggingApplicationClosure should not be nil")
        }
        return closure(tableView, session)
    }

}

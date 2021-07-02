//
//  FZTableViewDragDelegateDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

@available(iOS 11.0, *)
public class FZTableViewDragDelegateDecorator: NSObject {

    // MARK: - typealias

    public typealias ItemsForBeginningClosure = (_ tableView: UITableView, _ session: UIDragSession, _ indexPath: IndexPath) -> [UIDragItem]

    public typealias ItemsForAddingClosure = (_ tableView: UITableView, _ session: UIDragSession, _ indexPath: IndexPath, _ point: CGPoint) -> [UIDragItem]

    public typealias DragPreviewParametersForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> UIDragPreviewParameters?

    public typealias DragSessionWillBeginClosure = (_ tableView: UITableView, _ session: UIDragSession) -> Void

    public typealias DragSessionDidEndClosure = (_ tableView: UITableView, _ session: UIDragSession) -> Void

    public typealias DragSessionAllowsMoveOperationClosure = (_ tableView: UITableView, _ session: UIDragSession) -> Bool

    public typealias DragSessionIsRestrictedToDraggingApplicationClosure = (_ tableView: UITableView, _ session: UIDragSession) -> Bool

    // MARK: - property

    public var tableViewItemsForBeginningClosure: ItemsForBeginningClosure?

    public var tableViewItemsForAddingClosure: ItemsForAddingClosure?

    public var tableViewDragPreviewParametersForRowAtIndexPathClosure: DragPreviewParametersForRowAtIndexPathClosure?

    public var tableViewDragSessionWillBeginClosure: DragSessionWillBeginClosure?

    public var tableViewDragSessionDidEndClosure: DragSessionDidEndClosure?

    public var tableViewDragSessionAllowsMoveOperationClosure: DragSessionAllowsMoveOperationClosure?

    public var tableViewDragSessionIsRestrictedToDraggingApplicationClosure: DragSessionIsRestrictedToDraggingApplicationClosure?

}

// MARK: - DragDelegate 链式调用
@available(iOS 11.0, *)
extension FZTableViewDragDelegateDecorator {

    public func setTableViewItemsForBeginningClosure(_ closure: @escaping ItemsForBeginningClosure) -> Self {
        tableViewItemsForBeginningClosure = closure
        return self
    }

    public func setTableViewItemsForAddingClosure(_ closure: ItemsForAddingClosure?) -> Self {
        tableViewItemsForAddingClosure = closure
        return self
    }

    public func setTableViewDragPreviewParametersForRowAtIndexPathClosure(_ closure: DragPreviewParametersForRowAtIndexPathClosure?) -> Self {
        tableViewDragPreviewParametersForRowAtIndexPathClosure = closure
        return self
    }

    public func setTableViewDragSessionWillBeginClosure(_ closure: DragSessionWillBeginClosure?) -> Self {
        tableViewDragSessionWillBeginClosure = closure
        return self
    }

    public func setTableViewDragSessionDidEndClosure(_ closure: DragSessionDidEndClosure?) -> Self {
        tableViewDragSessionDidEndClosure = closure
        return self
    }

    public func setTableViewDragSessionAllowsMoveOperationClosure(_ closure: DragSessionAllowsMoveOperationClosure?) -> Self {
        tableViewDragSessionAllowsMoveOperationClosure = closure
        return self
    }

    public func setTableViewDragSessionIsRestrictedToDraggingApplicationClosure(_ closure: DragSessionIsRestrictedToDraggingApplicationClosure?) -> Self {
        tableViewDragSessionIsRestrictedToDraggingApplicationClosure = closure
        return self
    }

}

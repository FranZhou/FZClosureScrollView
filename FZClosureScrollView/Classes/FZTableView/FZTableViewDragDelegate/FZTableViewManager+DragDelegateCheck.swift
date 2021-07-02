//
//  FZTableViewManager+DragDelegateCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

/// optional method in DragDelegate
@available(iOS 11.0, *)
private enum TableViewDragDelegateOptionalSelector: String, CaseIterable {

    case itemsForAdding
    case dragPreviewParametersForRowAtIndexPath
    case dragSessionWillBegin
    case dragSessionDidEnd
    case dragSessionAllowsMoveOperation
    case dragSessionIsRestrictedToDraggingApplication

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .itemsForAdding:
                return #selector(UITableViewDragDelegate.tableView(_:itemsForAddingTo:at:point:))
            case .dragPreviewParametersForRowAtIndexPath:
                return #selector(UITableViewDragDelegate.tableView(_:dragPreviewParametersForRowAt:))
            case .dragSessionWillBegin:
                return #selector(UITableViewDragDelegate.tableView(_:dragSessionWillBegin:))
            case .dragSessionDidEnd:
                return #selector(UITableViewDragDelegate.tableView(_:dragSessionDidEnd:))
            case .dragSessionAllowsMoveOperation:
                return #selector(UITableViewDragDelegate.tableView(_:dragSessionAllowsMoveOperation:))
            case .dragSessionIsRestrictedToDraggingApplication:
                return #selector(UITableViewDragDelegate.tableView(_:dragSessionIsRestrictedToDraggingApplication:))
            @unknown default:
                return nil
        }
    }
}

// MARK: - check DragDelegate optional methods
@available(iOS 11.0, *)
extension FZTableViewManager {

    /// Whether the selector is an optional method in DragDelegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DragDelegate
    internal func isDragDelegateSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDragDelegateOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in DragDelegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DragDelegate can be called
    internal func checkDragDelegateResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = TableViewDragDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZTableViewManager checkDragDelegateResponds(to:) error")
        }

        switch optionalEnum {
            case .itemsForAdding:
                return tableViewDragDelegateDecorator?.tableViewItemsForAddingClosure != nil
            case .dragPreviewParametersForRowAtIndexPath:
                return tableViewDragDelegateDecorator?.tableViewDragPreviewParametersForRowAtIndexPathClosure != nil
            case .dragSessionWillBegin:
                return tableViewDragDelegateDecorator?.tableViewDragSessionWillBeginClosure != nil
            case .dragSessionDidEnd:
                return tableViewDragDelegateDecorator?.tableViewDragSessionDidEndClosure != nil
            case .dragSessionAllowsMoveOperation:
                return tableViewDragDelegateDecorator?.tableViewDragSessionAllowsMoveOperationClosure != nil
            case .dragSessionIsRestrictedToDraggingApplication:
                return tableViewDragDelegateDecorator?.tableViewDragSessionIsRestrictedToDraggingApplicationClosure != nil
            @unknown default:
                return false
        }
    }

}

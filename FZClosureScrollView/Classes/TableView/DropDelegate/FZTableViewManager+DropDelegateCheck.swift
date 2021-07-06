//
//  FZTableViewManager+DropDelegateSelectorResponds.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

// MARK: - enum
/// optional method in DropDelegate
@available(iOS 11.0, *)
private enum TableViewDropDelegateOptionalSelector: String, CaseIterable {

    case canHandleSession
    case dropSessionDidEnter
    case dropSessionDidUpdate
    case dropSessionDidExit
    case dropSessionDidEnd
    case dropPreviewParametersForRowAtIndexPath

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .canHandleSession:
                return #selector(UITableViewDropDelegate.tableView(_:canHandle:))
            case .dropSessionDidEnter:
                return #selector(UITableViewDropDelegate.tableView(_:dropSessionDidEnter:))
            case .dropSessionDidUpdate:
                return #selector(UITableViewDropDelegate.tableView(_:dropSessionDidUpdate:withDestinationIndexPath:))
            case .dropSessionDidExit:
                return #selector(UITableViewDropDelegate.tableView(_:dropSessionDidExit:))
            case .dropSessionDidEnd:
                return #selector(UITableViewDropDelegate.tableView(_:dropSessionDidEnd:))
            case .dropPreviewParametersForRowAtIndexPath:
                return #selector(UITableViewDropDelegate.tableView(_:dropPreviewParametersForRowAt:))
            @unknown default:
                return nil
        }
    }
}

// MARK: - check DropDelegate optional methods
@available(iOS 11.0, *)
extension FZTableViewManager {

    /// Whether the selector is an optional method in DropDelegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DropDelegate
    internal func isDropDelegateSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDropDelegateOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in DropDelegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DropDelegate can be called
    internal func checkDropDelegateResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = TableViewDropDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZTableViewManager checkDropDelegateResponds(to:) error")
        }

        switch optionalEnum {
            case .canHandleSession:
                return dropDelegateDecorator?.tableViewCanHandleSessionClosure != nil
            case .dropSessionDidEnter:
                return dropDelegateDecorator?.tableViewDropSessionDidEnterClosure != nil
            case .dropSessionDidUpdate:
                return dropDelegateDecorator?.tableViewDropSessionDidUpdateClosure != nil
            case .dropSessionDidExit:
                return dropDelegateDecorator?.tableViewDropSessionDidExitClosure != nil
            case .dropSessionDidEnd:
                return dropDelegateDecorator?.tableViewDropSessionDidEndClosure != nil
            case .dropPreviewParametersForRowAtIndexPath:
                return dropDelegateDecorator?.tableViewDropPreviewParametersForRowAtIndexPathClosure != nil
            @unknown default:
                return false
        }
    }

}

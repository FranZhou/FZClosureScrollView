//
//  FZTableViewManager+PrefetchDataSourceCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

// MARK: - enum
/// optional method in PrefetchDataSource
private enum TableViewPrefetchDataSourceOptionalSelector: String, CaseIterable {

    case cancelPrefetchingForRowsAtIndexPaths

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .cancelPrefetchingForRowsAtIndexPaths:
                return #selector(UITableViewDataSourcePrefetching.tableView(_:cancelPrefetchingForRowsAt:))
            @unknown default:
                return nil
        }
    }
}

// MARK: - check PrefetchDataSource optional methods
extension FZTableViewManager {

    /// Whether the selector is an optional method in PrefetchDataSource
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  PrefetchDataSource
    internal func isPrefetchDataSourceSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewPrefetchDataSourceOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in PrefetchDataSource
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in PrefetchDataSource can be called
    internal func checkPrefetchDataSourceResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = TableViewPrefetchDataSourceOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZTableViewManager checkPrefetchDataSourceResponds(to:) error")
        }

        switch optionalEnum {
            case .cancelPrefetchingForRowsAtIndexPaths:
                return tableViewPrefetchDataSourceDecorator?.tableViewCancelPrefetchingForRowsAtIndexPathsClosure != nil
            @unknown default:
                return false
        }
    }

}

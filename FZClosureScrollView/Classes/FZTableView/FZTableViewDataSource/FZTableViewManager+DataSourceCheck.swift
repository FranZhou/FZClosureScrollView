//
//  FZTableViewManager+DataSourceCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

// MARK: - enum

/// optional method in DataSource
private enum TableViewDataSourceOptionalSelector: String, CaseIterable {

    case numberOfSections
    case titleForHeaderInSection
    case titleForFooterInSection
    case canEditRowAtIndexPath
    case canMoveRowAtIndexPath
    case sectionIndexTitles
    case sectionForSectionIndexTitle
    case commitEditingStyle
    case moveRowAtSourceIndexPath

    /// enum -> Selector
    func selector() -> Selector? {
        switch self {
            case .numberOfSections:
                return #selector(UITableViewDataSource.numberOfSections(in:))
            case .titleForHeaderInSection:
                return #selector(UITableViewDataSource.tableView(_:titleForHeaderInSection:))
            case .titleForFooterInSection:
                return #selector(UITableViewDataSource.tableView(_:titleForFooterInSection:))
            case .canEditRowAtIndexPath:
                return #selector(UITableViewDataSource.tableView(_:canEditRowAt:))
            case .canMoveRowAtIndexPath:
                return #selector(UITableViewDataSource.tableView(_:canMoveRowAt:))
            case .sectionIndexTitles:
                return #selector(UITableViewDataSource.sectionIndexTitles(for:))
            case .sectionForSectionIndexTitle:
                return #selector(UITableViewDataSource.tableView(_:sectionForSectionIndexTitle:at:))
            case .commitEditingStyle:
                return #selector(UITableViewDataSource.tableView(_:commit:forRowAt:))
            case .moveRowAtSourceIndexPath:
                return #selector(UITableViewDataSource.tableView(_:moveRowAt:to:))
            @unknown default:
                return nil
        }
    }
}

// MARK: - check DataSource optional methods
extension FZTableViewManager {

    /// Whether the selector is an optional method in DataSource
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DataSource
    internal func isDataSourceSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDataSourceOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in DataSource
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DataSource can be called
    internal func checkDataSourceResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = TableViewDataSourceOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZTableViewManager checkDataSourceResponds(to:) error")
        }

        switch optionalEnum {
            case .numberOfSections:
                return tableViewDataSourceDecorator?.tableViewNumberOfSectionsClosure != nil
            case .titleForHeaderInSection:
                return tableViewDataSourceDecorator?.tableViewTitleForHeaderInSectionClosure != nil
            case .titleForFooterInSection:
                return tableViewDataSourceDecorator?.tableViewTitleForFooterInSectionClosure != nil
            case .canEditRowAtIndexPath:
                return tableViewDataSourceDecorator?.tableViewCanEditRowAtIndexPathClosure != nil
            case .canMoveRowAtIndexPath:
                return tableViewDataSourceDecorator?.tableViewCanMoveRowAtIndexPathClosure != nil
            case .sectionIndexTitles:
                return tableViewDataSourceDecorator?.tableViewSectionIndexTitlesClosure != nil
            case .sectionForSectionIndexTitle:
                return tableViewDataSourceDecorator?.tableViewSectionForSectionIndexTitleClosure != nil
            case .commitEditingStyle:
                return tableViewDataSourceDecorator?.tableViewCommitEditingStyleClosure != nil
            case .moveRowAtSourceIndexPath:
                return tableViewDataSourceDecorator?.tableViewMoveRowAtSourceIndexPathClosure != nil
            @unknown default:
                return false
        }
    }

}

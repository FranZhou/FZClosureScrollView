//
//  FZTableViewDataSourceDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

public class FZTableViewDataSourceDecorator: NSObject {

    // MARK: - typealias

    public typealias NumberOfRowsInSectionClosure = (_ tableView: UITableView, _ section: Int) -> Int

    public typealias CellForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell

    public typealias NumberOfSectionsClosure = (_ tableView: UITableView) -> Int

    public typealias TitleForHeaderInSectionClosure = (_ tableView: UITableView, _ section: Int) -> String?

    public typealias TitleForFooterInSectionClosure = (_ tableView: UITableView, _ section: Int) -> String?

    public typealias CanEditRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool

    public typealias CanMoveRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool

    public typealias SectionIndexTitlesClosure = (_ tableView: UITableView) -> [String]?

    public typealias SectionForSectionIndexTitleClosure = (_ tableView: UITableView, _ title: String, _ index: Int) -> Int

    public typealias CommitEditingStyleClosure = (_ tableView: UITableView, _ editingStyle: UITableViewCell.EditingStyle, _ indexPath: IndexPath) -> Void

    public typealias MoveRowAtSourceIndexPathClosure = (_ tableView: UITableView, _ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) -> Void

    // MARK: - property

    public var tableViewNumberOfRowsInSectionClosure: NumberOfRowsInSectionClosure?

    public var tableViewCellForRowAtIndexPathClosure: CellForRowAtIndexPathClosure?

    public var tableViewNumberOfSectionsClosure: NumberOfSectionsClosure?

    public var tableViewTitleForHeaderInSectionClosure: TitleForHeaderInSectionClosure?

    public var tableViewTitleForFooterInSectionClosure: TitleForFooterInSectionClosure?

    public var tableViewCanEditRowAtIndexPathClosure: CanEditRowAtIndexPathClosure?

    public var tableViewCanMoveRowAtIndexPathClosure: CanMoveRowAtIndexPathClosure?

    public var tableViewSectionIndexTitlesClosure: SectionIndexTitlesClosure?

    public var tableViewSectionForSectionIndexTitleClosure: SectionForSectionIndexTitleClosure?

    public var tableViewCommitEditingStyleClosure: CommitEditingStyleClosure?

    public var tableViewMoveRowAtSourceIndexPathClosure: MoveRowAtSourceIndexPathClosure?

}

// MARK: - dataSource 链式调用
extension FZTableViewDataSourceDecorator {

    @discardableResult
    public func setTableViewNumberOfRowsInSectionClosure(_ closure: @escaping NumberOfRowsInSectionClosure) -> Self {
        tableViewNumberOfRowsInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewCellForRowAtIndexPathClosure(_ closure: @escaping CellForRowAtIndexPathClosure) -> Self {
        tableViewCellForRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewNumberOfSectionsClosure(_ closure: NumberOfSectionsClosure?) -> Self {
        tableViewNumberOfSectionsClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewTitleForHeaderInSectionClosure(_ closure: TitleForHeaderInSectionClosure?) -> Self {
        tableViewTitleForHeaderInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewTitleForFooterInSectionClosure(_ closure: TitleForFooterInSectionClosure?) -> Self {
        tableViewTitleForFooterInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewCanEditRowAtIndexPathClosure(_ closure: CanEditRowAtIndexPathClosure?) -> Self {
        tableViewCanEditRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewCanMoveRowAtIndexPathClosure(_ closure: CanMoveRowAtIndexPathClosure?) -> Self {
        tableViewCanMoveRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewSectionIndexTitlesClosure(_ closure: SectionIndexTitlesClosure?) -> Self {
        tableViewSectionIndexTitlesClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewSectionForSectionIndexTitleClosure(_ closure: SectionForSectionIndexTitleClosure?) -> Self {
        tableViewSectionForSectionIndexTitleClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewCommitEditingStyleClosure(_ closure: CommitEditingStyleClosure?) -> Self {
        tableViewCommitEditingStyleClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewMoveRowAtSourceIndexPathClosure(_ closure: MoveRowAtSourceIndexPathClosure?) -> Self {
        tableViewMoveRowAtSourceIndexPathClosure = closure
        return self
    }

}

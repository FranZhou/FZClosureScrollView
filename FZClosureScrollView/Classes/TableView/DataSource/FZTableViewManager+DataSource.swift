//
//  FZTableViewManager+DataSource.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/1.
//

import UIKit

extension FZTableViewManager: UITableViewDataSource {

    // MARK: - required

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let closure = dataSourceDecorator?.tableViewNumberOfRowsInSectionClosure else {
            fatalError("dataSourceDecorator property tableViewNumberOfRowsInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let closure = dataSourceDecorator?.tableViewCellForRowAtIndexPathClosure else {
            fatalError("dataSourceDecorator property tableViewCellForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    // MARK: - optional 
    @available(iOS 2.0, *)
    public func numberOfSections(in tableView: UITableView) -> Int {
        guard let closure = dataSourceDecorator?.tableViewNumberOfSectionsClosure else {
            fatalError("dataSourceDecorator property tableViewNumberOfSectionsClosure should not be nil")
        }
        return closure(tableView)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let closure = dataSourceDecorator?.tableViewTitleForHeaderInSectionClosure else {
            fatalError("dataSourceDecorator property tableViewTitleForHeaderInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let closure = dataSourceDecorator?.tableViewTitleForFooterInSectionClosure else {
            fatalError("dataSourceDecorator property tableViewTitleForFooterInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let closure = dataSourceDecorator?.tableViewCanEditRowAtIndexPathClosure else {
            fatalError("dataSourceDecorator property tableViewCanEditRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        guard let closure = dataSourceDecorator?.tableViewCanMoveRowAtIndexPathClosure else {
            fatalError("dataSourceDecorator property tableViewCanMoveRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let closure = dataSourceDecorator?.tableViewSectionIndexTitlesClosure else {
            fatalError("dataSourceDecorator property tableViewSectionIndexTitlesClosure should not be nil")
        }
        return closure(tableView)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let closure = dataSourceDecorator?.tableViewSectionForSectionIndexTitleClosure else {
            fatalError("dataSourceDecorator property tableViewSectionForSectionIndexTitleClosure should not be nil")
        }
        return closure(tableView, title, index)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let closure = dataSourceDecorator?.tableViewCommitEditingStyleClosure else {
            fatalError("dataSourceDecorator property tableViewCommitEditingStyleClosure should not be nil")
        }
        closure(tableView, editingStyle, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let closure = dataSourceDecorator?.tableViewMoveRowAtSourceIndexPathClosure else {
            fatalError("dataSourceDecorator property tableViewMoveRowAtSourceIndexPathClosure should not be nil")
        }
        closure(tableView, sourceIndexPath, destinationIndexPath)
    }

}

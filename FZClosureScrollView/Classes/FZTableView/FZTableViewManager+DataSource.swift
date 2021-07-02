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
        guard let closure = tableViewDataSourceDecorator?.tableViewNumberOfRowsInSectionClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewNumberOfRowsInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let closure = tableViewDataSourceDecorator?.tableViewCellForRowAtIndexPathClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewCellForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    // MARK: - optional 
    @available(iOS 2.0, *)
    public func numberOfSections(in tableView: UITableView) -> Int {
        guard let closure = tableViewDataSourceDecorator?.tableViewNumberOfSectionsClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewNumberOfSectionsClosure should not be nil")
        }
        return closure(tableView)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let closure = tableViewDataSourceDecorator?.tableViewTitleForHeaderInSectionClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewTitleForHeaderInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let closure = tableViewDataSourceDecorator?.tableViewTitleForFooterInSectionClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewTitleForFooterInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let closure = tableViewDataSourceDecorator?.tableViewCanEditRowAtIndexPathClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewCanEditRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        guard let closure = tableViewDataSourceDecorator?.tableViewCanMoveRowAtIndexPathClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewCanMoveRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let closure = tableViewDataSourceDecorator?.tableViewSectionIndexTitlesClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewSectionIndexTitlesClosure should not be nil")
        }
        return closure(tableView)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let closure = tableViewDataSourceDecorator?.tableViewSectionForSectionIndexTitleClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewSectionForSectionIndexTitleClosure should not be nil")
        }
        return closure(tableView, title, index)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let closure = tableViewDataSourceDecorator?.tableViewCommitEditingStyleClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewCommitEditingStyleClosure should not be nil")
        }
        closure(tableView, editingStyle, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let closure = tableViewDataSourceDecorator?.tableViewMoveRowAtSourceIndexPathClosure else {
            fatalError("tableViewDataSourceDecorator property tableViewMoveRowAtSourceIndexPathClosure should not be nil")
        }
        closure(tableView, sourceIndexPath, destinationIndexPath)
    }

}

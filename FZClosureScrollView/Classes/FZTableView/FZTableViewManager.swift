//
//  FZTableViewManager.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/1.
//

import UIKit

/// All data sources and delegate methods are modified for closure processing.
/// The optional implementation method determines whether it can be called depending on when the appropriate closure is set
public class FZTableViewManager: FZScrollViewManager {

    // MARK: - enum

    /// optional method in DataSource
    internal enum TableViewDataSourceOptionalSelector: String, CaseIterable {

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

    /// optional method in Delegate
    internal enum TableViewDelegateOptionalSelector: String, CaseIterable {

        case willDisplayCell
        case willDisplayHeaderView
        case willDisplayFooterView
        case didEndDisplayingCell
        case didEndDisplayingHeaderView
        case didEndDisplayingFooterView
        case heightForRowAtIndexPath
        case heightForHeaderInSection
        case heightForFooterInSection
        case estimatedHeightForRowAtIndexPath
        case estimatedHeightForHeaderInSection
        case estimatedHeightForFooterInSection
        case viewForHeaderInSection
        case viewForFooterInSection
        case accessoryButtonTappedForRowWithIndexPath
        case shouldHighlightRowAtIndexPath
        case didHighlightRowAtIndexPath
        case didUnhighlightRowAtIndexPath
        case willSelectRowAtIndexPath
        case willDeselectRowAtIndexPath
        case didSelectRowAtIndexPath
        case didDeselectRowAtIndexPath
        case editingStyleForRowAtIndexPath
        case titleForDeleteConfirmationButtonForRowAtIndexPath
        case editActionsForRowAtIndexPath
        case leadingSwipeActionsConfigurationForRowAtIndexPath
        case trailingSwipeActionsConfigurationForRowAtIndexPath
        case shouldIndentWhileEditingRowAtIndexPath
        case willBeginEditingRowAtIndexPath
        case didEndEditingRowAtIndexPath
        case targetIndexPathForMoveFromRowAtIndexPath
        case indentationLevelForRowAtIndexPath
        case shouldShowMenuForRowAtIndexPath
        case canPerformAction
        case performAction
        case canFocusRowAtIndexPath
        case shouldUpdateFocus
        case didUpdateFocus
        case indexPathForPreferredFocusedView
        case shouldSpringLoadRowAtIndexPath
        case shouldBeginMultipleSelectionInteractionAtIndexPath
        case didBeginMultipleSelectionInteractionAtIndexPath
        case didEndMultipleSelectionInteraction
        case contextMenuConfigurationForRowAtIndexPath
        case previewForHighlightingContextMenuWithConfiguration
        case previewForDismissingContextMenuWithConfiguration
        case willPerformPreviewActionForMenu
        case willDisplayContextMenu
        case willEndContextMenuInteraction

        /// enum -> Selector
        func selector() -> Selector? {
            switch self {
                case .willDisplayCell:
                    return #selector(UITableViewDelegate.tableView(_:willDisplay:forRowAt:))
                case .willDisplayHeaderView:
                    return #selector(UITableViewDelegate.tableView(_:willDisplayHeaderView:forSection:))
                case .willDisplayFooterView:
                    return #selector(UITableViewDelegate.tableView(_:willDisplayFooterView:forSection:))
                case .didEndDisplayingCell:
                    return #selector(UITableViewDelegate.tableView(_:didEndDisplaying:forRowAt:))
                case .didEndDisplayingHeaderView:
                    return #selector(UITableViewDelegate.tableView(_:didEndDisplayingHeaderView:forSection:))
                case .didEndDisplayingFooterView:
                    return #selector(UITableViewDelegate.tableView(_:didEndDisplayingFooterView:forSection:))
                case .heightForRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:heightForRowAt:))
                case .heightForHeaderInSection:
                    return #selector(UITableViewDelegate.tableView(_:heightForHeaderInSection:))
                case .heightForFooterInSection:
                    return #selector(UITableViewDelegate.tableView(_:heightForFooterInSection:))
                case .estimatedHeightForRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:estimatedHeightForRowAt:))
                case .estimatedHeightForHeaderInSection:
                    return #selector(UITableViewDelegate.tableView(_:estimatedHeightForHeaderInSection:))
                case .estimatedHeightForFooterInSection:
                    return #selector(UITableViewDelegate.tableView(_:estimatedHeightForFooterInSection:))
                case .viewForHeaderInSection:
                    return #selector(UITableViewDelegate.tableView(_:viewForHeaderInSection:))
                case .viewForFooterInSection:
                    return #selector(UITableViewDelegate.tableView(_:viewForFooterInSection:))
                case .accessoryButtonTappedForRowWithIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:accessoryButtonTappedForRowWith:))
                case .shouldHighlightRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:shouldHighlightRowAt:))
                case .didHighlightRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:didHighlightRowAt:))
                case .didUnhighlightRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:didUnhighlightRowAt:))
                case .willSelectRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:willSelectRowAt:))
                case .willDeselectRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:willDeselectRowAt:))
                case .didSelectRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))
                case .didDeselectRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:didDeselectRowAt:))
                case .editingStyleForRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:editingStyleForRowAt:))
                case .titleForDeleteConfirmationButtonForRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:titleForDeleteConfirmationButtonForRowAt:))
                case .editActionsForRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:editActionsForRowAt:))
                case .leadingSwipeActionsConfigurationForRowAtIndexPath:
                    if #available(iOS 11.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:leadingSwipeActionsConfigurationForRowAt:))
                    } else {
                        return nil
                    }
                case .trailingSwipeActionsConfigurationForRowAtIndexPath:
                    if #available(iOS 11.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:trailingSwipeActionsConfigurationForRowAt:))
                    } else {
                        return nil
                    }
                case .shouldIndentWhileEditingRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:shouldIndentWhileEditingRowAt:))
                case .willBeginEditingRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:willBeginEditingRowAt:))
                case .didEndEditingRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:didEndEditingRowAt:))
                case .targetIndexPathForMoveFromRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:targetIndexPathForMoveFromRowAt:toProposedIndexPath:))
                case .indentationLevelForRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:indentationLevelForRowAt:))
                case .shouldShowMenuForRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:shouldShowMenuForRowAt:))
                case .canPerformAction:
                    return #selector(UITableViewDelegate.tableView(_:canPerformAction:forRowAt:withSender:))
                case .performAction:
                    return #selector(UITableViewDelegate.tableView(_:performAction:forRowAt:withSender:))
                case .canFocusRowAtIndexPath:
                    return #selector(UITableViewDelegate.tableView(_:canFocusRowAt:))
                case .shouldUpdateFocus:
                    return #selector(UITableViewDelegate.tableView(_:shouldUpdateFocusIn:))
                case .didUpdateFocus:
                    return #selector(UITableViewDelegate.tableView(_:didUpdateFocusIn:with:))
                case .indexPathForPreferredFocusedView:
                    return #selector(UITableViewDelegate.indexPathForPreferredFocusedView(in:))
                case .shouldSpringLoadRowAtIndexPath:
                    if #available(iOS 11.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:shouldSpringLoadRowAt:with:))
                    } else {
                        return nil
                    }
                case .shouldBeginMultipleSelectionInteractionAtIndexPath:
                    if #available(iOS 13.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:shouldBeginMultipleSelectionInteractionAt:))
                    } else {
                        return nil
                    }
                case .didBeginMultipleSelectionInteractionAtIndexPath:
                    if #available(iOS 13.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:didBeginMultipleSelectionInteractionAt:))
                    } else {
                        return nil
                    }
                case .didEndMultipleSelectionInteraction:
                    if #available(iOS 13.0, *) {
                        return #selector(UITableViewDelegate.tableViewDidEndMultipleSelectionInteraction(_:))
                    } else {
                        return nil
                    }
                case .contextMenuConfigurationForRowAtIndexPath:
                    if #available(iOS 13.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:contextMenuConfigurationForRowAt:point:))
                    } else {
                        return nil
                    }
                case .previewForHighlightingContextMenuWithConfiguration:
                    if #available(iOS 13.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:previewForHighlightingContextMenuWithConfiguration:))
                    } else {
                        return nil
                    }
                case .previewForDismissingContextMenuWithConfiguration:
                    if #available(iOS 13.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:previewForDismissingContextMenuWithConfiguration:))
                    } else {
                        return nil
                    }
                case .willPerformPreviewActionForMenu:
                    if #available(iOS 13.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:willPerformPreviewActionForMenuWith:animator:))
                    } else {
                        return nil
                    }
                case .willDisplayContextMenu:
                    if #available(iOS 14.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:willDisplayContextMenu:animator:))
                    } else {
                        return nil
                    }
                case .willEndContextMenuInteraction:
                    if #available(iOS 14.0, *) {
                        return #selector(UITableViewDelegate.tableView(_:willEndContextMenuInteraction:animator:))
                    } else {
                        return nil
                    }

                @unknown default:
                    return nil
            }
        }
    }

    /// optional method in PrefetchDataSource
    internal enum TableViewPrefetchDataSourceOptionalSelector: String, CaseIterable {

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

    /// optional method in DragDelegate
    @available(iOS 11.0, *)
    internal enum TableViewDragDelegateOptionalSelector: String, CaseIterable {

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

    /// optional method in DropDelegate
    @available(iOS 11.0, *)
    internal enum TableViewDropDelegateOptionalSelector: String, CaseIterable {

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

    // MARK: - property

    public var tableViewDataSourceDecorator: FZTableViewDataSourceDecorator?

    public var tableViewDelegateDecorator: FZTableViewDelegateDecorator?

    public var tableViewPrefetchDataSourceDecorator: FZTableViewPrefetchDataSourceDecorator?

    fileprivate var _tableViewDragDelegateDecorator: Any?
    @available(iOS 11.0, *)
    public var tableViewDragDelegateDecorator: FZTableViewDragDelegateDecorator? {
        get {
            return _tableViewDragDelegateDecorator as? FZTableViewDragDelegateDecorator
        }
        set {
            _tableViewDragDelegateDecorator = newValue
        }
    }

    fileprivate var _tableViewDropDelegateDecorator: Any?
    @available(iOS 11.0, *)
    public var tableViewDropDelegateDecorator: FZTableViewDropDelegateDecorator? {
        get {
            return _tableViewDropDelegateDecorator as? FZTableViewDropDelegateDecorator
        }
        set {
            _tableViewDropDelegateDecorator = newValue
        }
    }

    // MARK: - override
    public override func responds(to aSelector: Selector!) -> Bool {
        if shouldCheckResponds(to: aSelector) {
            return checkResponds(to: aSelector)
        }
        return super.responds(to: aSelector)
    }
}

// MARK: - optional method check
extension FZTableViewManager {

    /// Whether the selector is an optional method
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional
    private func shouldCheckResponds(to selector: Selector) -> Bool {
        if isDataSourceSelector(selector)
            || isDelegateSelector(selector)
            || isPrefetchDataSourceSelector(selector) {
            return true
        }

        if #available(iOS 11.0, *) {
            if isDragDelegateSelector(selector)
                || isDropDelegateSelector(selector) {
                return true
            }
        }

        return false
    }

    /// Check whether the optional method  can actually be called
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method can be called
    private func checkResponds(to selector: Selector) -> Bool {
        if isDataSourceSelector(selector) {
            return checkDataSourceResponds(to: selector)
        } else if isDelegateSelector(selector) {
            return checkDelegateResponds(to: selector)
        } else if isPrefetchDataSourceSelector(selector) {
            return checkPrefetchDataSourceResponds(to: selector)
        }

        if #available(iOS 11.0, *) {
            if isDragDelegateSelector(selector) {
                return checkDragDelegateResponds(to: selector)
            } else if isDropDelegateSelector(selector) {
                return checkDropDelegateResponds(to: selector)
            }
        }

        return false
    }
}

// MARK: - check DataSource optional methods
extension FZTableViewManager {

    /// Whether the selector is an optional method in DataSource
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DataSource
    private func isDataSourceSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDataSourceOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in DataSource
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DataSource can be called
    private func checkDataSourceResponds(to selector: Selector) -> Bool {
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

// MARK: - check Delegate optional methods
extension FZTableViewManager {

    /// Whether the selector is an optional method in the Delegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  Delegate
    private func isDelegateSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDelegateOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method in Delegate can actually be called in Delegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in Delegate can be called
    private func checkDelegateResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = TableViewDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZTableViewManager checkDelegateResponds(to:) error")
        }

        switch optionalEnum {
            case .willDisplayCell:
                return tableViewDelegateDecorator?.tableViewWillDisplayCellClosure != nil
            case .willDisplayHeaderView:
                return tableViewDelegateDecorator?.tableViewWillDisplayHeaderViewClosure != nil
            case .willDisplayFooterView:
                return tableViewDelegateDecorator?.tableViewWillDisplayFooterViewClosure != nil
            case .didEndDisplayingCell:
                return tableViewDelegateDecorator?.tableViewDidEndDisplayingCellClosure != nil
            case .didEndDisplayingHeaderView:
                return tableViewDelegateDecorator?.tableViewDidEndDisplayingHeaderViewClosure != nil
            case .didEndDisplayingFooterView:
                return tableViewDelegateDecorator?.tableViewDidEndDisplayingFooterViewClosure != nil
            case .heightForRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewHeightForRowAtIndexPathClosure != nil
            case .heightForHeaderInSection:
                return tableViewDelegateDecorator?.tableViewHeightForHeaderInSectionClosure != nil
            case .heightForFooterInSection:
                return tableViewDelegateDecorator?.tableViewHeightForFooterInSectionClosure != nil
            case .estimatedHeightForRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewEstimatedHeightForRowAtIndexPathClosure != nil
            case .estimatedHeightForHeaderInSection:
                return tableViewDelegateDecorator?.tableViewEstimatedHeightForHeaderInSectionClosure != nil
            case .estimatedHeightForFooterInSection:
                return tableViewDelegateDecorator?.tableViewEstimatedHeightForFooterInSectionClosure != nil
            case .viewForHeaderInSection:
                return tableViewDelegateDecorator?.tableViewViewForHeaderInSectionClosure != nil
            case .viewForFooterInSection:
                return tableViewDelegateDecorator?.tableViewViewForFooterInSectionClosure != nil
            case .accessoryButtonTappedForRowWithIndexPath:
                return tableViewDelegateDecorator?.tableViewAccessoryButtonTappedForRowWithIndexPathClosure != nil
            case .shouldHighlightRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewShouldHighlightRowAtIndexPathClosure != nil
            case .didHighlightRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewDidHighlightRowAtIndexPathClosure != nil
            case .didUnhighlightRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewDidUnhighlightRowAtIndexPathClosure != nil
            case .willSelectRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewWillSelectRowAtIndexPathClosure != nil
            case .willDeselectRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewWillDeselectRowAtIndexPathClosure != nil
            case .didSelectRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewDidSelectRowAtIndexPathClosure != nil
            case .didDeselectRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewDidDeselectRowAtIndexPathClosure != nil
            case .editingStyleForRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewEditingStyleForRowAtIndexPathClosure != nil
            case .titleForDeleteConfirmationButtonForRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathClosure != nil
            case .editActionsForRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewEditActionsForRowAtIndexPathClosure != nil
            case .leadingSwipeActionsConfigurationForRowAtIndexPath:
                if #available(iOS 11.0, *) {
                    return tableViewDelegateDecorator?.tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .trailingSwipeActionsConfigurationForRowAtIndexPath:
                if #available(iOS 11.0, *) {
                    return tableViewDelegateDecorator?.tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .shouldIndentWhileEditingRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewShouldIndentWhileEditingRowAtIndexPathClosure != nil
            case .willBeginEditingRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewWillBeginEditingRowAtIndexPathClosure != nil
            case .didEndEditingRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewDidEndEditingRowAtIndexPathClosure != nil
            case .targetIndexPathForMoveFromRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewTargetIndexPathForMoveFromRowAtIndexPathClosure != nil
            case .indentationLevelForRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewIndentationLevelForRowAtIndexPathClosure != nil
            case .shouldShowMenuForRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewShouldShowMenuForRowAtIndexPathClosure != nil
            case .canPerformAction:
                return tableViewDelegateDecorator?.tableViewCanPerformActionClosure != nil
            case .performAction:
                return tableViewDelegateDecorator?.tableViewPerformActionClosure != nil
            case .canFocusRowAtIndexPath:
                return tableViewDelegateDecorator?.tableViewCanFocusRowAtIndexPathClosure != nil
            case .shouldUpdateFocus:
                return tableViewDelegateDecorator?.tableViewShouldUpdateFocusClosure != nil
            case .didUpdateFocus:
                return tableViewDelegateDecorator?.tableViewDidUpdateFocusClosure != nil
            case .indexPathForPreferredFocusedView:
                return tableViewDelegateDecorator?.tableViewIndexPathForPreferredFocusedViewClosure != nil
            case .shouldSpringLoadRowAtIndexPath:
                if #available(iOS 11.0, *) {
                    return tableViewDelegateDecorator?.tableViewShouldSpringLoadRowAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .shouldBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return tableViewDelegateDecorator?.tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .didBeginMultipleSelectionInteractionAtIndexPath:
                if #available(iOS 13.0, *) {
                    return tableViewDelegateDecorator?.tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure != nil
                } else {
                    return false
                }
            case .didEndMultipleSelectionInteraction:
                if #available(iOS 13.0, *) {
                    return tableViewDelegateDecorator?.tableViewDidEndMultipleSelectionInteractionClosure != nil
                } else {
                    return false
                }
            case .contextMenuConfigurationForRowAtIndexPath:
                if #available(iOS 13.0, *) {
                    return tableViewDelegateDecorator?.tableViewContextMenuConfigurationForRowAtIndexPathClosure != nil
                } else {
                    return false
                }
            case .previewForHighlightingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return tableViewDelegateDecorator?.tableViewPreviewForHighlightingContextMenuWithConfigurationClosure != nil
                } else {
                    return false
                }
            case .previewForDismissingContextMenuWithConfiguration:
                if #available(iOS 13.0, *) {
                    return tableViewDelegateDecorator?.tableViewPreviewForDismissingContextMenuWithConfigurationClosure != nil
                } else {
                    return false
                }
            case .willPerformPreviewActionForMenu:
                if #available(iOS 13.0, *) {
                    return tableViewDelegateDecorator?.tableViewWillPerformPreviewActionForMenuClosure != nil
                } else {
                    return false
                }
            case .willDisplayContextMenu:
                if #available(iOS 14.0, *) {
                    return tableViewDelegateDecorator?.tableViewWillDisplayContextMenuClosure != nil
                } else {
                    return false
                }
            case .willEndContextMenuInteraction:
                if #available(iOS 14.0, *) {
                    return tableViewDelegateDecorator?.tableViewWillEndContextMenuInteractionClosure != nil
                } else {
                    return false
                }
            @unknown default:
                return false
        }

    }
}

// MARK: - check PrefetchDataSource optional methods
extension FZTableViewManager {

    /// Whether the selector is an optional method in PrefetchDataSource
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  PrefetchDataSource
    private func isPrefetchDataSourceSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewPrefetchDataSourceOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in PrefetchDataSource
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in PrefetchDataSource can be called
    private func checkPrefetchDataSourceResponds(to selector: Selector) -> Bool {
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

// MARK: - check DragDelegate optional methods
@available(iOS 11.0, *)
extension FZTableViewManager {

    /// Whether the selector is an optional method in DragDelegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DragDelegate
    private func isDragDelegateSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDragDelegateOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in DragDelegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DragDelegate can be called
    private func checkDragDelegateResponds(to selector: Selector) -> Bool {
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

// MARK: - check DropDelegate optional methods
@available(iOS 11.0, *)
extension FZTableViewManager {

    /// Whether the selector is an optional method in DropDelegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  DropDelegate
    private func isDropDelegateSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDropDelegateOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called in DropDelegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in DropDelegate can be called
    private func checkDropDelegateResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = TableViewDropDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZTableViewManager checkDropDelegateResponds(to:) error")
        }

        switch optionalEnum {
            case .canHandleSession:
                return tableViewDropDelegateDecorator?.tableViewCanHandleSessionClosure != nil
            case .dropSessionDidEnter:
                return tableViewDropDelegateDecorator?.tableViewDropSessionDidEnterClosure != nil
            case .dropSessionDidUpdate:
                return tableViewDropDelegateDecorator?.tableViewDropSessionDidUpdateClosure != nil
            case .dropSessionDidExit:
                return tableViewDropDelegateDecorator?.tableViewDropSessionDidExitClosure != nil
            case .dropSessionDidEnd:
                return tableViewDropDelegateDecorator?.tableViewDropSessionDidEndClosure != nil
            case .dropPreviewParametersForRowAtIndexPath:
                return tableViewDropDelegateDecorator?.tableViewDropPreviewParametersForRowAtIndexPathClosure != nil
            @unknown default:
                return false
        }
    }

}

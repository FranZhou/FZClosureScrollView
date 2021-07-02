//
//  FZTableViewManager+DelegateCheck.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/2.
//

import UIKit

// MARK: - enum

/// optional method in Delegate
private enum TableViewDelegateOptionalSelector: String, CaseIterable {

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

// MARK: - check Delegate optional methods
extension FZTableViewManager {

    /// Whether the selector is an optional method in the Delegate
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional in  Delegate
    internal func isDelegateSelector(_ selector: Selector) -> Bool {
        let optionalSelector = TableViewDelegateOptionalSelector.allCases.compactMap { dataSourceSelector in
            return dataSourceSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method in Delegate can actually be called in Delegate
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method in Delegate can be called
    internal func checkDelegateResponds(to selector: Selector) -> Bool {
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

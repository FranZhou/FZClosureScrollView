//
//  FZTableViewManager+Delegate.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/1.
//

import UIKit

extension FZTableViewManager: UITableViewDelegate {

    // MARK: - optional

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewWillDisplayCellClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillDisplayCellClosure should not be nil")
        }
        closure(tableView, cell, indexPath)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let closure = tableViewDelegateDecorator?.tableViewWillDisplayHeaderViewClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillDisplayHeaderViewClosure should not be nil")
        }
        closure(tableView, view, section)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        guard let closure = tableViewDelegateDecorator?.tableViewWillDisplayFooterViewClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillDisplayFooterViewClosure should not be nil")
        }
        closure(tableView, view, section)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidEndDisplayingCellClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidEndDisplayingCellClosure should not be nil")
        }
        closure(tableView, cell, indexPath)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidEndDisplayingHeaderViewClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidEndDisplayingHeaderViewClosure should not be nil")
        }
        closure(tableView, view, section)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidEndDisplayingFooterViewClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidEndDisplayingFooterViewClosure should not be nil")
        }
        closure(tableView, view, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let closure = tableViewDelegateDecorator?.tableViewHeightForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewHeightForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let closure = tableViewDelegateDecorator?.tableViewHeightForHeaderInSectionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewHeightForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let closure = tableViewDelegateDecorator?.tableViewHeightForFooterInSectionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewHeightForFooterInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 7.0, *)
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let closure = tableViewDelegateDecorator?.tableViewEstimatedHeightForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewEstimatedHeightForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 7.0, *)
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        guard let closure = tableViewDelegateDecorator?.tableViewEstimatedHeightForHeaderInSectionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewEstimatedHeightForHeaderInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 7.0, *)
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        guard let closure = tableViewDelegateDecorator?.tableViewEstimatedHeightForFooterInSectionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewEstimatedHeightForFooterInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let closure = tableViewDelegateDecorator?.tableViewViewForHeaderInSectionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewViewForHeaderInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let closure = tableViewDelegateDecorator?.tableViewViewForFooterInSectionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewViewForFooterInSectionClosure should not be nil")
        }
        return closure(tableView, section)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewAccessoryButtonTappedForRowWithIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewAccessoryButtonTappedForRowWithIndexPathClosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewShouldHighlightRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewShouldHighlightRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidHighlightRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidHighlightRowAtIndexPathClosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 6.0, *)
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidUnhighlightRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidUnhighlightRowAtIndexPathClosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let closure = tableViewDelegateDecorator?.tableViewWillSelectRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillSelectRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 3.0, *)
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let closure = tableViewDelegateDecorator?.tableViewWillDeselectRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillDeselectRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidSelectRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidSelectRowAtIndexPathClosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 3.0, *)
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidDeselectRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidDeselectRowAtIndexPathClosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        guard let closure = tableViewDelegateDecorator?.tableViewEditingStyleForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewEditingStyleForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 3.0, *)
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        guard let closure = tableViewDelegateDecorator?.tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS, introduced: 8.0, deprecated: 13.0)
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        guard let closure = tableViewDelegateDecorator?.tableViewEditActionsForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewEditActionsForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let closure = tableViewDelegateDecorator?.tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let closure = tableViewDelegateDecorator?.tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewShouldIndentWhileEditingRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewShouldIndentWhileEditingRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewWillBeginEditingRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillBeginEditingRowAtIndexPathClosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidEndEditingRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidEndEditingRowAtIndexPathClosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        guard let closure = tableViewDelegateDecorator?.tableViewTargetIndexPathForMoveFromRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewTargetIndexPathForMoveFromRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, sourceIndexPath, proposedDestinationIndexPath)
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        guard let closure = tableViewDelegateDecorator?.tableViewIndentationLevelForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewIndentationLevelForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewShouldShowMenuForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewShouldShowMenuForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewCanPerformActionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewCanPerformActionClosure should not be nil")
        }
        return closure(tableView, action, indexPath, sender)
    }

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        guard let closure = tableViewDelegateDecorator?.tableViewPerformActionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewPerformActionClosure should not be nil")
        }
        closure(tableView, action, indexPath, sender)
    }

    @available(iOS 9.0, *)
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewCanFocusRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewCanFocusRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 9.0, *)
    public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewShouldUpdateFocusClosure else {
            fatalError("tableViewDelegateDecorator property tableViewShouldUpdateFocusClosure should not be nil")
        }
        return closure(tableView, context)
    }

    @available(iOS 9.0, *)
    public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidUpdateFocusClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidUpdateFocusClosure should not be nil")
        }
        closure(tableView, context, coordinator)
    }

    @available(iOS 9.0, *)
    public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        guard let closure = tableViewDelegateDecorator?.tableViewIndexPathForPreferredFocusedViewClosure else {
            fatalError("tableViewDelegateDecorator property tableViewIndexPathForPreferredFocusedViewClosure should not be nil")
        }
        return closure(tableView)
    }

    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewShouldSpringLoadRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewShouldSpringLoadRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath, context)
    }

    @available(iOS 13.0, *)
    public func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        guard let closure = tableViewDelegateDecorator?.tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath)
    }

    @available(iOS 13.0, *)
    public func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure should not be nil")
        }
        closure(tableView, indexPath)
    }

    @available(iOS 13.0, *)
    public func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
        guard let closure = tableViewDelegateDecorator?.tableViewDidEndMultipleSelectionInteractionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewDidEndMultipleSelectionInteractionClosure should not be nil")
        }
        closure(tableView)
    }

    @available(iOS 13.0, *)
    public func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        guard let closure = tableViewDelegateDecorator?.tableViewContextMenuConfigurationForRowAtIndexPathClosure else {
            fatalError("tableViewDelegateDecorator property tableViewContextMenuConfigurationForRowAtIndexPathClosure should not be nil")
        }
        return closure(tableView, indexPath, point)
    }

    @available(iOS 13.0, *)
    public func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let closure = tableViewDelegateDecorator?.tableViewPreviewForHighlightingContextMenuWithConfigurationClosure else {
            fatalError("tableViewDelegateDecorator property tableViewPreviewForHighlightingContextMenuWithConfigurationClosure should not be nil")
        }
        return closure(tableView, configuration)
    }

    @available(iOS 13.0, *)
    public func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let closure = tableViewDelegateDecorator?.tableViewPreviewForDismissingContextMenuWithConfigurationClosure else {
            fatalError("tableViewDelegateDecorator property tableViewPreviewForDismissingContextMenuWithConfigurationClosure should not be nil")
        }
        return closure(tableView, configuration)
    }

    @available(iOS 13.0, *)
    public func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        guard let closure = tableViewDelegateDecorator?.tableViewWillPerformPreviewActionForMenuClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillPerformPreviewActionForMenuClosure should not be nil")
        }
        closure(tableView, configuration, animator)
    }

    @available(iOS 14.0, *)
    public func tableView(_ tableView: UITableView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        guard let closure = tableViewDelegateDecorator?.tableViewWillDisplayContextMenuClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillDisplayContextMenuClosure should not be nil")
        }
        closure(tableView, configuration, animator)
    }

    @available(iOS 14.0, *)
    public func tableView(_ tableView: UITableView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        guard let closure = tableViewDelegateDecorator?.tableViewWillEndContextMenuInteractionClosure else {
            fatalError("tableViewDelegateDecorator property tableViewWillEndContextMenuInteractionClosure should not be nil")
        }
        closure(tableView, configuration, animator)
    }

}

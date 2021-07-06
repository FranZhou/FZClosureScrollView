//
//  FZTableViewDelegateDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/7/1.
//

import UIKit

public class FZTableViewDelegateDecorator: FZScrollViewDelegateDecorator {

    // MARK: - typealias

    public typealias WillDisplayCellClosure = (_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void

    public typealias WillDisplayHeaderViewClosure = (_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void

    public typealias WillDisplayFooterViewClosure = (_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void

    public typealias DidEndDisplayingCellClosure = (_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void

    public typealias DidEndDisplayingHeaderViewClosure = (_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void

    public typealias DidEndDisplayingFooterViewClosure = (_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void

    public typealias HeightForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat

    public typealias HeightForHeaderInSectionClosure = (_ tableView: UITableView, _ section: Int) -> CGFloat

    public typealias HeightForFooterInSectionClosure = (_ tableView: UITableView, _ section: Int) -> CGFloat

    public typealias EstimatedHeightForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat

    public typealias EstimatedHeightForHeaderInSectionClosure = (_ tableView: UITableView, _ section: Int) -> CGFloat

    public typealias EstimatedHeightForFooterInSectionClosure = (_ tableView: UITableView, _ section: Int) -> CGFloat

    public typealias ViewForHeaderInSectionClosure = (_ tableView: UITableView, _ section: Int) -> UIView?

    public typealias ViewForFooterInSectionClosure = (_ tableView: UITableView, _ section: Int) -> UIView?

    public typealias AccessoryButtonTappedForRowWithIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void

    public typealias ShouldHighlightRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool

    public typealias DidHighlightRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void

    public typealias DidUnhighlightRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void

    public typealias WillSelectRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath?

    public typealias WillDeselectRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath?

    public typealias DidSelectRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void

    public typealias DidDeselectRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void

    public typealias EditingStyleForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell.EditingStyle

    public typealias TitleForDeleteConfirmationButtonForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> String?

    public typealias EditActionsForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> [UITableViewRowAction]?

    @available(iOS 11.0, *)
    public typealias LeadingSwipeActionsConfigurationForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> UISwipeActionsConfiguration?

    @available(iOS 11.0, *)
    public typealias TrailingSwipeActionsConfigurationForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> UISwipeActionsConfiguration?

    public typealias ShouldIndentWhileEditingRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool

    public typealias WillBeginEditingRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void

    public typealias DidEndEditingRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath?) -> Void

    public typealias TargetIndexPathForMoveFromRowAtIndexPathClosure = (_ tableView: UITableView, _ sourceIndexPath: IndexPath, _ proposedDestinationIndexPath: IndexPath) -> IndexPath

    public typealias IndentationLevelForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Int

    public typealias ShouldShowMenuForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool

    public typealias CanPerformActionClosure = (_ tableView: UITableView, _ action: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Bool

    public typealias PerformActionClosure = (_ tableView: UITableView, _ action: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Void

    public typealias CanFocusRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool

    public typealias ShouldUpdateFocusClosure = (_ tableView: UITableView, _ context: UITableViewFocusUpdateContext) -> Bool

    public typealias DidUpdateFocusClosure = (_ tableView: UITableView, _ context: UITableViewFocusUpdateContext, _ coordinator: UIFocusAnimationCoordinator) -> Void

    public typealias IndexPathForPreferredFocusedViewClosure = (_ tableView: UITableView) -> IndexPath?

    @available(iOS 11.0, *)
    public typealias ShouldSpringLoadRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath, _ context: UISpringLoadedInteractionContext) -> Bool

    @available(iOS 13.0, *)
    public typealias ShouldBeginMultipleSelectionInteractionAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Bool

    @available(iOS 13.0, *)
    public typealias DidBeginMultipleSelectionInteractionAtIndexPathlosure = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void

    @available(iOS 13.0, *)
    public typealias DidEndMultipleSelectionInteractionClosure = (_ tableView: UITableView) -> Void

    @available(iOS 13.0, *)
    public typealias ContextMenuConfigurationForRowAtIndexPathClosure = (_ tableView: UITableView, _ indexPath: IndexPath, _ point: CGPoint) -> UIContextMenuConfiguration?

    @available(iOS 13.0, *)
    public typealias PreviewForHighlightingContextMenuWithConfigurationClosure = (_ tableView: UITableView, _ configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    @available(iOS 13.0, *)
    public typealias PreviewForDismissingContextMenuWithConfigurationClosure = (_ tableView: UITableView, _ configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    @available(iOS 13.0, *)
    public typealias WillPerformPreviewActionForMenuClosure = (_ tableView: UITableView, _ configuration: UIContextMenuConfiguration, _ animator: UIContextMenuInteractionCommitAnimating) -> Void

    @available(iOS 14.0, *)
    public typealias WillDisplayContextMenuClosure = (_ tableView: UITableView, _ configuration: UIContextMenuConfiguration, _ animator: UIContextMenuInteractionAnimating?) -> Void

    @available(iOS 14.0, *)
    public typealias WillEndContextMenuInteractionClosure = (_ tableView: UITableView, _ configuration: UIContextMenuConfiguration, _ animator: UIContextMenuInteractionAnimating?) -> Void

    // MARK: - property

    public var tableViewWillDisplayCellClosure: WillDisplayCellClosure?

    public var tableViewWillDisplayHeaderViewClosure: WillDisplayHeaderViewClosure?

    public var tableViewWillDisplayFooterViewClosure: WillDisplayFooterViewClosure?

    public var tableViewDidEndDisplayingCellClosure: DidEndDisplayingCellClosure?

    public var tableViewDidEndDisplayingHeaderViewClosure: DidEndDisplayingHeaderViewClosure?

    public var tableViewDidEndDisplayingFooterViewClosure: DidEndDisplayingFooterViewClosure?

    public var tableViewHeightForRowAtIndexPathClosure: HeightForRowAtIndexPathClosure?

    public var tableViewHeightForHeaderInSectionClosure: HeightForHeaderInSectionClosure?

    public var tableViewHeightForFooterInSectionClosure: HeightForFooterInSectionClosure?

    public var tableViewEstimatedHeightForRowAtIndexPathClosure: EstimatedHeightForRowAtIndexPathClosure?

    public var tableViewEstimatedHeightForHeaderInSectionClosure: EstimatedHeightForHeaderInSectionClosure?

    public var tableViewEstimatedHeightForFooterInSectionClosure: EstimatedHeightForFooterInSectionClosure?

    public var tableViewViewForHeaderInSectionClosure: ViewForHeaderInSectionClosure?

    public var tableViewViewForFooterInSectionClosure: ViewForFooterInSectionClosure?

    public var tableViewAccessoryButtonTappedForRowWithIndexPathClosure: AccessoryButtonTappedForRowWithIndexPathClosure?

    public var tableViewShouldHighlightRowAtIndexPathClosure: ShouldHighlightRowAtIndexPathClosure?

    public var tableViewDidHighlightRowAtIndexPathClosure: DidHighlightRowAtIndexPathClosure?

    public var tableViewDidUnhighlightRowAtIndexPathClosure: DidUnhighlightRowAtIndexPathClosure?

    public var tableViewWillSelectRowAtIndexPathClosure: WillSelectRowAtIndexPathClosure?

    public var tableViewWillDeselectRowAtIndexPathClosure: WillDeselectRowAtIndexPathClosure?

    public var tableViewDidSelectRowAtIndexPathClosure: DidSelectRowAtIndexPathClosure?

    public var tableViewDidDeselectRowAtIndexPathClosure: DidDeselectRowAtIndexPathClosure?

    public var tableViewEditingStyleForRowAtIndexPathClosure: EditingStyleForRowAtIndexPathClosure?

    public var tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathClosure: TitleForDeleteConfirmationButtonForRowAtIndexPathClosure?

    public var tableViewEditActionsForRowAtIndexPathClosure: EditActionsForRowAtIndexPathClosure?

    private var _tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure: Any?
    @available(iOS 11.0, *)
    public var tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure: LeadingSwipeActionsConfigurationForRowAtIndexPathClosure? {
        get {
            return _tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure as? LeadingSwipeActionsConfigurationForRowAtIndexPathClosure
        }
        set {
            _tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure = newValue
        }
    }

    private var _tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure: Any?
    @available(iOS 11.0, *)
    public var tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure: TrailingSwipeActionsConfigurationForRowAtIndexPathClosure? {
        get {
            _tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure as? TrailingSwipeActionsConfigurationForRowAtIndexPathClosure
        }
        set {
            _tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure = newValue
        }
    }

    public var tableViewShouldIndentWhileEditingRowAtIndexPathClosure: ShouldIndentWhileEditingRowAtIndexPathClosure?

    public var tableViewWillBeginEditingRowAtIndexPathClosure: WillBeginEditingRowAtIndexPathClosure?

    public var tableViewDidEndEditingRowAtIndexPathClosure: DidEndEditingRowAtIndexPathClosure?

    public var tableViewTargetIndexPathForMoveFromRowAtIndexPathClosure: TargetIndexPathForMoveFromRowAtIndexPathClosure?

    public var tableViewIndentationLevelForRowAtIndexPathClosure: IndentationLevelForRowAtIndexPathClosure?

    public var tableViewShouldShowMenuForRowAtIndexPathClosure: ShouldShowMenuForRowAtIndexPathClosure?

    public var tableViewCanPerformActionClosure: CanPerformActionClosure?

    public var tableViewPerformActionClosure: PerformActionClosure?

    public var tableViewCanFocusRowAtIndexPathClosure: CanFocusRowAtIndexPathClosure?

    public var tableViewShouldUpdateFocusClosure: ShouldUpdateFocusClosure?

    public var tableViewDidUpdateFocusClosure: DidUpdateFocusClosure?

    public var tableViewIndexPathForPreferredFocusedViewClosure: IndexPathForPreferredFocusedViewClosure?

    private var _tableViewShouldSpringLoadRowAtIndexPathClosure: Any?
    @available(iOS 11.0, *)
    public var tableViewShouldSpringLoadRowAtIndexPathClosure: ShouldSpringLoadRowAtIndexPathClosure? {
        get {
            return _tableViewShouldSpringLoadRowAtIndexPathClosure as? ShouldSpringLoadRowAtIndexPathClosure
        }
        set {
            _tableViewShouldSpringLoadRowAtIndexPathClosure = newValue
        }
    }

    private var _tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure: Any?
    @available(iOS 13.0, *)
    public var tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure: ShouldBeginMultipleSelectionInteractionAtIndexPathClosure? {
        get {
            return _tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure as? ShouldBeginMultipleSelectionInteractionAtIndexPathClosure
        }
        set {
            _tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure = newValue
        }
    }

    private var _tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure: Any?
    @available(iOS 13.0, *)
    public var tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure: DidBeginMultipleSelectionInteractionAtIndexPathlosure? {
        get {
            return _tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure as? DidBeginMultipleSelectionInteractionAtIndexPathlosure
        }
        set {
            _tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure = newValue
        }
    }

    private var _tableViewDidEndMultipleSelectionInteractionClosure: Any?
    @available(iOS 13.0, *)
    public var tableViewDidEndMultipleSelectionInteractionClosure: DidEndMultipleSelectionInteractionClosure? {
        get {
            return _tableViewDidEndMultipleSelectionInteractionClosure as? DidEndMultipleSelectionInteractionClosure
        }
        set {
            _tableViewDidEndMultipleSelectionInteractionClosure = newValue
        }
    }

    private var _tableViewContextMenuConfigurationForRowAtIndexPathClosure: Any?
    @available(iOS 13.0, *)
    public var tableViewContextMenuConfigurationForRowAtIndexPathClosure: ContextMenuConfigurationForRowAtIndexPathClosure? {
        get {
            return _tableViewContextMenuConfigurationForRowAtIndexPathClosure as? ContextMenuConfigurationForRowAtIndexPathClosure
        }
        set {
            _tableViewContextMenuConfigurationForRowAtIndexPathClosure = newValue
        }
    }

    private var _tableViewPreviewForHighlightingContextMenuWithConfigurationClosure: Any?
    @available(iOS 13.0, *)
    public var tableViewPreviewForHighlightingContextMenuWithConfigurationClosure: PreviewForHighlightingContextMenuWithConfigurationClosure? {
        get {
            return _tableViewPreviewForHighlightingContextMenuWithConfigurationClosure as? PreviewForHighlightingContextMenuWithConfigurationClosure
        }
        set {
            _tableViewPreviewForHighlightingContextMenuWithConfigurationClosure = newValue
        }
    }

    private var _tableViewPreviewForDismissingContextMenuWithConfigurationClosure: Any?
    @available(iOS 13.0, *)
    public var tableViewPreviewForDismissingContextMenuWithConfigurationClosure: PreviewForDismissingContextMenuWithConfigurationClosure? {
        get {
            return _tableViewPreviewForDismissingContextMenuWithConfigurationClosure as? PreviewForDismissingContextMenuWithConfigurationClosure
        }
        set {
            _tableViewPreviewForDismissingContextMenuWithConfigurationClosure = newValue
        }
    }

    private var _tableViewWillPerformPreviewActionForMenuClosure: Any?
    @available(iOS 13.0, *)
    public var tableViewWillPerformPreviewActionForMenuClosure: WillPerformPreviewActionForMenuClosure? {
        get {
            return _tableViewWillPerformPreviewActionForMenuClosure as? WillPerformPreviewActionForMenuClosure
        }
        set {
            _tableViewWillPerformPreviewActionForMenuClosure = newValue
        }
    }

    private var _tableViewWillDisplayContextMenuClosure: Any?
    @available(iOS 14.0, *)
    public var tableViewWillDisplayContextMenuClosure: WillDisplayContextMenuClosure? {
        get {
            return _tableViewWillDisplayContextMenuClosure as? WillDisplayContextMenuClosure
        }
        set {
            _tableViewWillDisplayContextMenuClosure = newValue
        }
    }

    private var _tableViewWillEndContextMenuInteractionClosure: Any?
    @available(iOS 14.0, *)
    public var tableViewWillEndContextMenuInteractionClosure: WillEndContextMenuInteractionClosure? {
        get {
            return _tableViewWillEndContextMenuInteractionClosure as? WillEndContextMenuInteractionClosure
        }
        set {
            _tableViewWillEndContextMenuInteractionClosure = newValue
        }
    }

}

// MARK: - delegate 链式调用
extension FZTableViewDelegateDecorator {

    @discardableResult
    public func setTableViewWillDisplayCellClosure(_ closure: WillDisplayCellClosure?) -> Self {
        tableViewWillDisplayCellClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewWillDisplayHeaderViewClosure(_ closure: WillDisplayHeaderViewClosure?) -> Self {
        tableViewWillDisplayHeaderViewClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewWillDisplayFooterViewClosure(_ closure: WillDisplayFooterViewClosure?) -> Self {
        tableViewWillDisplayFooterViewClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidEndDisplayingCellClosure(_ closure: DidEndDisplayingCellClosure?) -> Self {
        tableViewDidEndDisplayingCellClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidEndDisplayingHeaderViewClosure(_ closure: DidEndDisplayingHeaderViewClosure?) -> Self {
        tableViewDidEndDisplayingHeaderViewClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidEndDisplayingFooterViewClosure(_ closure: DidEndDisplayingFooterViewClosure?) -> Self {
        tableViewDidEndDisplayingFooterViewClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewHeightForRowAtIndexPathClosure(_ closure: HeightForRowAtIndexPathClosure?) -> Self {
        tableViewHeightForRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewHeightForHeaderInSectionClosure(_ closure: HeightForHeaderInSectionClosure?) -> Self {
        tableViewHeightForHeaderInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewHeightForFooterInSectionClosure(_ closure: HeightForFooterInSectionClosure?) -> Self {
        tableViewHeightForFooterInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewEstimatedHeightForRowAtIndexPathClosure(_ closure: EstimatedHeightForRowAtIndexPathClosure?) -> Self {
        tableViewEstimatedHeightForRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewEstimatedHeightForHeaderInSectionClosure(_ closure: EstimatedHeightForHeaderInSectionClosure?) -> Self {
        tableViewEstimatedHeightForHeaderInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewEstimatedHeightForFooterInSectionClosure(_ closure: EstimatedHeightForFooterInSectionClosure?) -> Self {
        tableViewEstimatedHeightForFooterInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewViewForHeaderInSectionClosure(_ closure: ViewForHeaderInSectionClosure?) -> Self {
        tableViewViewForHeaderInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewViewForFooterInSectionClosure(_ closure: ViewForFooterInSectionClosure?) -> Self {
        tableViewViewForFooterInSectionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewAccessoryButtonTappedForRowWithIndexPathClosure(_ closure: AccessoryButtonTappedForRowWithIndexPathClosure?) -> Self {
        tableViewAccessoryButtonTappedForRowWithIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewShouldHighlightRowAtIndexPathClosure(_ closure: ShouldHighlightRowAtIndexPathClosure?) -> Self {
        tableViewShouldHighlightRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidHighlightRowAtIndexPathClosure(_ closure: DidHighlightRowAtIndexPathClosure?) -> Self {
        tableViewDidHighlightRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidUnhighlightRowAtIndexPathClosure(_ closure: DidUnhighlightRowAtIndexPathClosure?) -> Self {
        tableViewDidUnhighlightRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewWillSelectRowAtIndexPathClosure(_ closure: WillSelectRowAtIndexPathClosure?) -> Self {
        tableViewWillSelectRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewWillDeselectRowAtIndexPathClosure(_ closure: WillDeselectRowAtIndexPathClosure?) -> Self {
        tableViewWillDeselectRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidSelectRowAtIndexPathClosure(_ closure: DidSelectRowAtIndexPathClosure?) -> Self {
        tableViewDidSelectRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidDeselectRowAtIndexPathClosure(_ closure: DidDeselectRowAtIndexPathClosure?) -> Self {
        tableViewDidDeselectRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewEditingStyleForRowAtIndexPathClosure(_ closure: EditingStyleForRowAtIndexPathClosure?) -> Self {
        tableViewEditingStyleForRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewTitleForDeleteConfirmationButtonForRowAtIndexPathClosure(_ closure: TitleForDeleteConfirmationButtonForRowAtIndexPathClosure?) -> Self {
        tableViewTitleForDeleteConfirmationButtonForRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewEditActionsForRowAtIndexPathClosure(_ closure: EditActionsForRowAtIndexPathClosure?) -> Self {
        tableViewEditActionsForRowAtIndexPathClosure = closure
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    public func setTableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure(_ closure: LeadingSwipeActionsConfigurationForRowAtIndexPathClosure?) -> Self {
        tableViewLeadingSwipeActionsConfigurationForRowAtIndexPathClosure = closure
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    public func setTableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure(_ closure: TrailingSwipeActionsConfigurationForRowAtIndexPathClosure?) -> Self {
        tableViewTrailingSwipeActionsConfigurationForRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewShouldIndentWhileEditingRowAtIndexPathClosure(_ closure: ShouldIndentWhileEditingRowAtIndexPathClosure?) -> Self {
        tableViewShouldIndentWhileEditingRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewWillBeginEditingRowAtIndexPathClosure(_ closure: WillBeginEditingRowAtIndexPathClosure?) -> Self {
        tableViewWillBeginEditingRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidEndEditingRowAtIndexPathClosure(_ closure: DidEndEditingRowAtIndexPathClosure?) -> Self {
        tableViewDidEndEditingRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewTargetIndexPathForMoveFromRowAtIndexPathClosure(_ closure: TargetIndexPathForMoveFromRowAtIndexPathClosure?) -> Self {
        tableViewTargetIndexPathForMoveFromRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewIndentationLevelForRowAtIndexPathClosure(_ closure: IndentationLevelForRowAtIndexPathClosure?) -> Self {
        tableViewIndentationLevelForRowAtIndexPathClosure = closure
        return self
    }
    @discardableResult
    public func setTableViewShouldShowMenuForRowAtIndexPathClosure(_ closure: ShouldShowMenuForRowAtIndexPathClosure?) -> Self {
        tableViewShouldShowMenuForRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewCanPerformActionClosure(_ closure: CanPerformActionClosure?) -> Self {
        tableViewCanPerformActionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewPerformActionClosure(_ closure: PerformActionClosure?) -> Self {
        tableViewPerformActionClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewCanFocusRowAtIndexPathClosure(_ closure: CanFocusRowAtIndexPathClosure?) -> Self {
        tableViewCanFocusRowAtIndexPathClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewShouldUpdateFocusClosure(_ closure: ShouldUpdateFocusClosure?) -> Self {
        tableViewShouldUpdateFocusClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewDidUpdateFocusClosure(_ closure: DidUpdateFocusClosure?) -> Self {
        tableViewDidUpdateFocusClosure = closure
        return self
    }

    @discardableResult
    public func setTableViewIndexPathForPreferredFocusedViewClosure(_ closure: IndexPathForPreferredFocusedViewClosure?) -> Self {
        tableViewIndexPathForPreferredFocusedViewClosure = closure
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    public func setTableViewShouldSpringLoadRowAtIndexPathClosure(_ closure: ShouldSpringLoadRowAtIndexPathClosure?) -> Self {
        tableViewShouldSpringLoadRowAtIndexPathClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func setTableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure(_ closure: ShouldBeginMultipleSelectionInteractionAtIndexPathClosure?) -> Self {
        tableViewShouldBeginMultipleSelectionInteractionAtIndexPathClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func setTableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure(_ closure: DidBeginMultipleSelectionInteractionAtIndexPathlosure?) -> Self {
        tableViewDidBeginMultipleSelectionInteractionAtIndexPathlosure = closure
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func setTableViewDidEndMultipleSelectionInteractionClosure(_ closure: DidEndMultipleSelectionInteractionClosure?) -> Self {
        tableViewDidEndMultipleSelectionInteractionClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func setTableViewContextMenuConfigurationForRowAtIndexPathClosure(_ closure: ContextMenuConfigurationForRowAtIndexPathClosure?) -> Self {
        tableViewContextMenuConfigurationForRowAtIndexPathClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func setTableViewPreviewForHighlightingContextMenuWithConfigurationClosure(_ closure: PreviewForHighlightingContextMenuWithConfigurationClosure?) -> Self {
        tableViewPreviewForHighlightingContextMenuWithConfigurationClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func setTableViewPreviewForDismissingContextMenuWithConfigurationClosure(_ closure: PreviewForDismissingContextMenuWithConfigurationClosure?) -> Self {
        tableViewPreviewForDismissingContextMenuWithConfigurationClosure = closure
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func setTableViewWillPerformPreviewActionForMenuClosure(_ closure: WillPerformPreviewActionForMenuClosure?) -> Self {
        tableViewWillPerformPreviewActionForMenuClosure = closure
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    public func setTableViewWillDisplayContextMenuClosure(_ closure: WillDisplayContextMenuClosure?) -> Self {
        tableViewWillDisplayContextMenuClosure = closure
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    public func setTableViewWillEndContextMenuInteractionClosure(_ closure: WillEndContextMenuInteractionClosure?) -> Self {
        tableViewWillEndContextMenuInteractionClosure = closure
        return self
    }

}

//
//  FZScrollViewManager.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/6/24.
//

import UIKit

/// optional method in Delegate
private enum ScrollViewDelegateOptionalSelector: String, CaseIterable {
    case didScroll
    case didZoom
    case willBeginDragging
    case willEndDragging
    case didEndDragging
    case willBeginDecelerating
    case didEndDecelerating
    case didEndScrollingAnimation
    case viewForZooming
    case willBeginZooming
    case didEndZooming
    case shouldScrollToTop
    case didScrollToTop
    case didChangeAdjustedContentInset

    func selector() -> Selector? {
        switch self {
            case .didScroll:
                return #selector(UIScrollViewDelegate.scrollViewDidScroll(_:))
            case .didZoom:
                return #selector(UIScrollViewDelegate.scrollViewDidZoom(_:))
            case .willBeginDragging:
                return #selector(UIScrollViewDelegate.scrollViewWillBeginDragging(_:))
            case .willEndDragging:
                return #selector(UIScrollViewDelegate.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:))
            case .didEndDragging:
                return #selector(UIScrollViewDelegate.scrollViewDidEndDragging(_:willDecelerate:))
            case .willBeginDecelerating:
                return #selector(UIScrollViewDelegate.scrollViewWillBeginDecelerating(_:))
            case .didEndDecelerating:
                return #selector(UIScrollViewDelegate.scrollViewDidEndDecelerating(_:))
            case .didEndScrollingAnimation:
                return #selector(UIScrollViewDelegate.scrollViewDidEndScrollingAnimation(_:))
            case .viewForZooming:
                return #selector(UIScrollViewDelegate.viewForZooming(in:))
            case .willBeginZooming:
                return #selector(UIScrollViewDelegate.scrollViewWillBeginZooming(_:with:))
            case .didEndZooming:
                return #selector(UIScrollViewDelegate.scrollViewDidEndZooming(_:with:atScale:))
            case .shouldScrollToTop:
                return #selector(UIScrollViewDelegate.scrollViewShouldScrollToTop(_:))
            case .didScrollToTop:
                return #selector(UIScrollViewDelegate.scrollViewDidScrollToTop(_:))
            case .didChangeAdjustedContentInset:
                if #available(iOS 11.0, *) {
                    return #selector(UIScrollViewDelegate.scrollViewDidChangeAdjustedContentInset(_:))
                } else {
                    return nil
                }
            @unknown default:
                return nil
        }
    }
}

// MARK: -
public class FZScrollViewManager: NSObject {

    // MARK: - property
    public var delegateDecorator: FZScrollViewDelegateDecorator?

    // MARK: - override
    public override func responds(to aSelector: Selector!) -> Bool {
        if shouldCheckResponds(to: aSelector) {
            return checkResponds(to: aSelector)
        }
        return super.responds(to: aSelector)
    }

}

// MARK: - optional method check
extension FZScrollViewManager {

    /// Whether the selector is an optional method
    /// - Parameter selector: selector
    /// - Returns: Returns true to indicate that the selector is optional
    private func shouldCheckResponds(to selector: Selector) -> Bool {
        let optionalSelector = ScrollViewDelegateOptionalSelector.allCases.compactMap { optionalSelector in
            return optionalSelector.selector()
        }
        return optionalSelector.contains(selector)
    }

    /// Check whether the optional method  can actually be called
    /// - Parameter selector: selector
    /// - Returns: Return true to indicate that the optional method  can be called
    private func checkResponds(to selector: Selector) -> Bool {
        guard let optionalEnum = ScrollViewDelegateOptionalSelector.allCases.first(where: { _optionalEnum in
            return _optionalEnum.selector() == selector
        }) else {
            fatalError("FZScrollViewManager checkResponds(to:) error")
        }

        switch optionalEnum {
            case .didScroll:
                return delegateDecorator?.scrollViewDidScrollClosure != nil
            case .didZoom:
                return delegateDecorator?.scrollViewDidZoomClosure != nil
            case .willBeginDragging:
                return delegateDecorator?.scrollViewWillBeginDraggingClosure != nil
            case .willEndDragging:
                return delegateDecorator?.scrollViewWillEndDraggingClosure != nil
            case .didEndDragging:
                return delegateDecorator?.scrollViewDidEndDraggingClosure != nil
            case .willBeginDecelerating:
                return delegateDecorator?.scrollViewWillBeginDeceleratingClosure != nil
            case .didEndDecelerating:
                return delegateDecorator?.scrollViewDidEndDeceleratingClosure != nil
            case .didEndScrollingAnimation:
                return delegateDecorator?.scrollViewDidEndScrollingAnimationClosure != nil
            case .viewForZooming:
                return delegateDecorator?.viewForZoomingClosure != nil
            case .willBeginZooming:
                return delegateDecorator?.scrollViewWillBeginZoomingClosure != nil
            case .didEndZooming:
                return delegateDecorator?.scrollViewDidEndZoomingClosure != nil
            case .shouldScrollToTop:
                return delegateDecorator?.scrollViewShouldScrollToTopClosure != nil
            case .didScrollToTop:
                return delegateDecorator?.scrollViewDidScrollToTopClosure != nil
            case .didChangeAdjustedContentInset:
                if #available(iOS 11.0, *) {
                    return delegateDecorator?.scrollViewDidChangeAdjustedContentInsetClosure != nil
                } else {
                    return false
                }
            @unknown default:
                return false
        }

    }

}

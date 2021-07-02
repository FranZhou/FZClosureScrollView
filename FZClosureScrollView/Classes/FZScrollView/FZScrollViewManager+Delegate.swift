//
//  FZScrollViewManager+Delegate.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/6/24.
//

import UIKit

extension FZScrollViewManager: UIScrollViewDelegate {

    // MARK: - optional

    @available(iOS 2.0, *)
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidScrollClosure else {
            fatalError("scrollViewDecorator property scrollViewDidScrollClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 3.2, *)
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidZoomClosure else {
            fatalError("scrollViewDecorator property scrollViewDidZoomClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewWillBeginDraggingClosure else {
            fatalError("scrollViewDecorator property scrollViewWillBeginDraggingClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 5.0, *)
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewWillEndDraggingClosure else {
            fatalError("scrollViewDecorator property scrollViewWillEndDraggingClosure should not be nil")
        }
        closure(scrollView, velocity, targetContentOffset)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidEndDraggingClosure else {
            fatalError("scrollViewDecorator property scrollViewDidEndDraggingClosure should not be nil")
        }
        closure(scrollView, decelerate)
    }

    @available(iOS 2.0, *)
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewWillBeginDraggingClosure else {
            fatalError("scrollViewDecorator property scrollViewWillBeginDraggingClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidEndDeceleratingClosure else {
            fatalError("scrollViewDecorator property scrollViewDidEndDeceleratingClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidEndScrollingAnimationClosure else {
            fatalError("scrollViewDecorator property scrollViewDidEndScrollingAnimationClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        guard let closure = scrollViewDelegateDecorator?.viewForZoomingClosure else {
            fatalError("scrollViewDecorator property viewForZoomingClosure should not be nil")
        }
        return closure(scrollView)
    }

    @available(iOS 3.2, *)
    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewWillBeginZoomingClosure else {
            fatalError("scrollViewDecorator property scrollViewWillBeginZoomingClosure should not be nil")
        }
        closure(scrollView, view)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidEndZoomingClosure else {
            fatalError("scrollViewDecorator property scrollViewDidEndZoomingClosure should not be nil")
        }
        closure(scrollView, view, scale)
    }

    @available(iOS 2.0, *)
    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        guard let closure = scrollViewDelegateDecorator?.scrollViewShouldScrollToTopClosure else {
            fatalError("scrollViewDecorator property scrollViewShouldScrollToTopClosure should not be nil")
        }
        return closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidScrollToTopClosure else {
            fatalError("scrollViewDecorator property scrollViewDidScrollToTopClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 11.0, *)
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        guard let closure = scrollViewDelegateDecorator?.scrollViewDidChangeAdjustedContentInsetClosure else {
            fatalError("scrollViewDecorator property scrollViewDidChangeAdjustedContentInsetClosure should not be nil")
        }
        closure(scrollView)
    }

}

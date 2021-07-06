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
        guard let closure = delegateDecorator?.scrollViewDidScrollClosure else {
            fatalError("delegateDecorator property scrollViewDidScrollClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 3.2, *)
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        guard let closure = delegateDecorator?.scrollViewDidZoomClosure else {
            fatalError("delegateDecorator property scrollViewDidZoomClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        guard let closure = delegateDecorator?.scrollViewWillBeginDraggingClosure else {
            fatalError("delegateDecorator property scrollViewWillBeginDraggingClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 5.0, *)
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let closure = delegateDecorator?.scrollViewWillEndDraggingClosure else {
            fatalError("delegateDecorator property scrollViewWillEndDraggingClosure should not be nil")
        }
        closure(scrollView, velocity, targetContentOffset)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let closure = delegateDecorator?.scrollViewDidEndDraggingClosure else {
            fatalError("delegateDecorator property scrollViewDidEndDraggingClosure should not be nil")
        }
        closure(scrollView, decelerate)
    }

    @available(iOS 2.0, *)
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        guard let closure = delegateDecorator?.scrollViewWillBeginDraggingClosure else {
            fatalError("delegateDecorator property scrollViewWillBeginDraggingClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let closure = delegateDecorator?.scrollViewDidEndDeceleratingClosure else {
            fatalError("delegateDecorator property scrollViewDidEndDeceleratingClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        guard let closure = delegateDecorator?.scrollViewDidEndScrollingAnimationClosure else {
            fatalError("delegateDecorator property scrollViewDidEndScrollingAnimationClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        guard let closure = delegateDecorator?.viewForZoomingClosure else {
            fatalError("delegateDecorator property viewForZoomingClosure should not be nil")
        }
        return closure(scrollView)
    }

    @available(iOS 3.2, *)
    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        guard let closure = delegateDecorator?.scrollViewWillBeginZoomingClosure else {
            fatalError("delegateDecorator property scrollViewWillBeginZoomingClosure should not be nil")
        }
        closure(scrollView, view)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        guard let closure = delegateDecorator?.scrollViewDidEndZoomingClosure else {
            fatalError("delegateDecorator property scrollViewDidEndZoomingClosure should not be nil")
        }
        closure(scrollView, view, scale)
    }

    @available(iOS 2.0, *)
    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        guard let closure = delegateDecorator?.scrollViewShouldScrollToTopClosure else {
            fatalError("delegateDecorator property scrollViewShouldScrollToTopClosure should not be nil")
        }
        return closure(scrollView)
    }

    @available(iOS 2.0, *)
    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        guard let closure = delegateDecorator?.scrollViewDidScrollToTopClosure else {
            fatalError("delegateDecorator property scrollViewDidScrollToTopClosure should not be nil")
        }
        closure(scrollView)
    }

    @available(iOS 11.0, *)
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        guard let closure = delegateDecorator?.scrollViewDidChangeAdjustedContentInsetClosure else {
            fatalError("delegateDecorator property scrollViewDidChangeAdjustedContentInsetClosure should not be nil")
        }
        closure(scrollView)
    }

}

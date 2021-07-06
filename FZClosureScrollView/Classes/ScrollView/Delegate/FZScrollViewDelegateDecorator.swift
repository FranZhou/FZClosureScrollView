//
//  FZScrollViewDelegateDecorator.swift
//  FZClosureScrollView
//
//  Created by Fan Zhou on 2021/6/24.
//

import UIKit

public class FZScrollViewDelegateDecorator: NSObject {

    // MARK: - typealias
    public typealias DidScrollClosure = (_ scrollView: UIScrollView) -> Void

    public typealias DidZoomClosure = (_ scrollView: UIScrollView) -> Void

    public typealias WillBeginDraggingClosure = (_ scrollView: UIScrollView) -> Void

    public typealias WillEndDraggingClosure = (_ scrollView: UIScrollView, _ velocity: CGPoint, _ targetContentOffset: UnsafeMutablePointer<CGPoint>) -> Void

    public typealias DidEndDraggingClosure = (_ scrollView: UIScrollView, _ decelerate: Bool) -> Void

    public typealias WillBeginDeceleratingClosure = (_ scrollView: UIScrollView) -> Void

    public typealias DidEndDeceleratingClosure = (_ scrollView: UIScrollView) -> Void

    public typealias DidEndScrollingAnimationClosure = (_ scrollView: UIScrollView) -> Void

    public typealias ViewForZoomingClosure = (_ scrollView: UIScrollView) -> UIView?

    public typealias WillBeginZoomingClosure = (_ scrollView: UIScrollView, _ view: UIView?) -> Void

    public typealias DidEndZoomingClosure = (_ scrollView: UIScrollView, _ view: UIView?, _ scale: CGFloat) -> Void

    public typealias ShouldScrollToTopClosure = (_ scrollView: UIScrollView) -> Bool

    public typealias DidScrollToTopClosure = (_ scrollView: UIScrollView) -> Void

    public typealias DidChangeAdjustedContentInsetClosure = (_ scrollView: UIScrollView) -> Void

    // MARK: - property
    public var scrollViewDidScrollClosure: DidScrollClosure?

    public var scrollViewDidZoomClosure: DidZoomClosure?

    public var scrollViewWillBeginDraggingClosure: WillBeginDraggingClosure?

    public var scrollViewWillEndDraggingClosure: WillEndDraggingClosure?

    public var scrollViewDidEndDraggingClosure: DidEndDraggingClosure?

    public var scrollViewWillBeginDeceleratingClosure: WillBeginDeceleratingClosure?

    public var scrollViewDidEndDeceleratingClosure: DidEndDeceleratingClosure?

    public var scrollViewDidEndScrollingAnimationClosure: DidEndScrollingAnimationClosure?

    public var viewForZoomingClosure: ViewForZoomingClosure?

    public var scrollViewWillBeginZoomingClosure: WillBeginZoomingClosure?

    public var scrollViewDidEndZoomingClosure: DidEndZoomingClosure?

    public var scrollViewShouldScrollToTopClosure: ShouldScrollToTopClosure?

    public var scrollViewDidScrollToTopClosure: DidScrollToTopClosure?

    public var scrollViewDidChangeAdjustedContentInsetClosure: DidChangeAdjustedContentInsetClosure?

}

// MARK: - 链式调用
extension FZScrollViewDelegateDecorator {

    @discardableResult
    public func setScrollViewDidScrollClosure(_ closure: DidScrollClosure?) -> Self {
        scrollViewDidScrollClosure = closure
        return self
    }

    @discardableResult
    public func setScrollViewDidZoomClosure(_ closure: DidZoomClosure?) -> Self {
        scrollViewDidZoomClosure = closure
        return self
    }

    @discardableResult
    public func setScrollViewWillBeginDraggingClosure(_ closure: WillBeginDraggingClosure?) -> Self {
        scrollViewWillBeginDraggingClosure = closure
        return self
    }

    @discardableResult
    public func setScrollViewWillEndDraggingClosure(_ closure: WillEndDraggingClosure?) -> Self {
        scrollViewWillEndDraggingClosure = closure
        return self
    }

    @discardableResult
    public func setScrollViewDidEndDraggingClosure(_ closure: DidEndDraggingClosure?) -> Self {
        scrollViewDidEndDraggingClosure = closure
        return self
    }

    @discardableResult
    public func setScrollViewWillBeginDeceleratingClosure(_ closure: WillBeginDeceleratingClosure?) -> Self {
        scrollViewWillBeginDeceleratingClosure = closure
        return self
    }

    @discardableResult
    public func scrollViewDidEndDeceleratingClosure(_ closure: DidEndDeceleratingClosure?) -> Self {
        scrollViewDidEndDeceleratingClosure = closure
        return self
    }

    @discardableResult
    public func scrollViewDidEndScrollingAnimationClosure(_ closure: DidEndScrollingAnimationClosure?) -> Self {
        scrollViewDidEndScrollingAnimationClosure = closure
        return self
    }

    @discardableResult
    public func viewForZoomingClosure(_ closure: ViewForZoomingClosure?) -> Self {
        viewForZoomingClosure = closure
        return self
    }

    @discardableResult
    public func scrollViewWillBeginZoomingClosure(_ closure: WillBeginZoomingClosure?) -> Self {
        scrollViewWillBeginZoomingClosure = closure
        return self
    }

    @discardableResult
    public func scrollViewDidEndZoomingClosure(_ closure: DidEndZoomingClosure?) -> Self {
        scrollViewDidEndZoomingClosure = closure
        return self
    }

    @discardableResult
    public func scrollViewShouldScrollToTopClosure(_ closure: ShouldScrollToTopClosure?) -> Self {
        scrollViewShouldScrollToTopClosure = closure
        return self
    }

    @discardableResult
    public func scrollViewDidScrollToTopClosure(_ closure: DidScrollToTopClosure?) -> Self {
        scrollViewDidScrollToTopClosure = closure
        return self
    }

    @discardableResult
    public func scrollViewDidChangeAdjustedContentInsetClosure(_ closure: DidChangeAdjustedContentInsetClosure?) -> Self {
        scrollViewDidChangeAdjustedContentInsetClosure = closure
        return self
    }

}

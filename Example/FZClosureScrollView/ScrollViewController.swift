//
//  ScrollViewController.swift
//  FZClosureScrollView_Example
//
//  Created by Fan Zhou on 2021/7/6.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

import FZClosureScrollView

class ScrollViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: 300, height: 500))
        scrollView.contentSize = CGSize(width: 400, height: 600)
        scrollView.backgroundColor = .cyan
        scrollView.delegate = manager
        return scrollView
    }()

    lazy var manager: FZScrollViewManager = {
        let manager = FZScrollViewManager()

        manager.delegateDecorator = FZScrollViewDelegateDecorator()
        manager.delegateDecorator?.setScrollViewDidScrollClosure({ _ in
            print("ScrollViewDidScroll")
        }).setScrollViewDidZoomClosure({ _ in
            print("ScrollViewDidZoom")
        }).setScrollViewDidEndDraggingClosure({ _, decelerate in
            print("ScrollViewDidEndDragging \(decelerate)")
        })

        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        title = "FZScrollViewManager"

        view.backgroundColor = .white
        view.addSubview(scrollView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  CollectionViewController.swift
//  FZClosureScrollView_Example
//
//  Created by Fan Zhou on 2021/7/6.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import FZClosureScrollView

class CollectionViewController: UIViewController {

    lazy var manager: FZCollectionViewManager = {
        let manager = FZCollectionViewManager()

        // delegate
        manager.collectionViewDelegateDecorator = FZCollectionViewDelegateDecorator()

        manager.collectionViewDelegateDecorator?.setCollectionViewDidSelectItemAtIndexPathClosure({ _, indexPath in
            print("CollectionViewDidSelectItemAtIndexPath:\(indexPath)")
        })

        // dataSource
        manager.dataSourceDecorator = FZCollectionViewDataSourceDecorator()

        manager.dataSourceDecorator?.setCollectionViewNumberOfItemsInSectionClosure({ _, _ in
            return 9
        }).setCollectionViewCellForItemAtIndexPathClosure({ collectionView, indexPath in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.description(), for: indexPath)
            var label = cell.contentView.viewWithTag(100) as? UILabel
            if label == nil {
                label = UILabel()
                label?.textAlignment = .center
                label?.textColor = .darkText
                label?.tag = 100
                label?.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
                cell.contentView.addSubview(label!)
            }
            label?.text = "\(indexPath)"
            cell.contentView.backgroundColor = .magenta
            return cell
        })

        return manager
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)

        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = manager
        collectionView.dataSource = manager
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.description())

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.addSubview(collectionView)
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

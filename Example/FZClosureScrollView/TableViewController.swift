//
//  TableViewController.swift
//  FZClosureScrollView_Example
//
//  Created by Fan Zhou on 2021/7/6.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

import FZClosureScrollView

class TableViewController: UIViewController {

    lazy var manager: FZTableViewManager = {
        let manager = FZTableViewManager()

        manager.tableViewDelegateDecorator = FZTableViewDelegateDecorator()

        // scrollView delegate
        manager.tableViewDelegateDecorator?.setScrollViewDidScrollClosure({ _ in
            print("TableViewDidScrollClosure")
        })

        // tableView delegate
        manager.tableViewDelegateDecorator?.setTableViewDidSelectRowAtIndexPathClosure({ [weak self] _, indexPath in
            print("DidSelectRowAtIndexPath:\(indexPath)")
        })

        // tableView dataSource
        manager.dataSourceDecorator = FZTableViewDataSourceDecorator()
        manager.dataSourceDecorator?.setTableViewNumberOfRowsInSectionClosure({ _, _ in
            return 3
        }).setTableViewCellForRowAtIndexPathClosure({ tableView, indexPath in
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
            switch indexPath.row {
                case 0:
                    cell.textLabel?.text = "ScrollView"
                case 1:
                    cell.textLabel?.text = "TableView"
                case 2:
                    cell.textLabel?.text = "CollectionView"
                default:
                    cell.textLabel?.text = ""
            }
            return cell
        })

        return manager
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.delegate = manager
        tableView.dataSource = manager
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableView)
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

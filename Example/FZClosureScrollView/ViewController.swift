//
//  ViewController.swift
//  FZClosureScrollView
//
//  Created by FranZhou on 07/02/2021.
//  Copyright (c) 2021 FranZhou. All rights reserved.
//

import UIKit
import FZClosureScrollView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    lazy var tableViewManager: FZTableViewManager = {
        let manager = FZTableViewManager()

        manager.tableViewDelegateDecorator = FZTableViewDelegateDecorator()
        manager.tableViewDelegateDecorator?.setScrollViewDidScrollClosure({ _ in
            print("ScrollViewDidScrollClosure")
        })

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

        manager.tableViewDelegateDecorator?.setTableViewDidSelectRowAtIndexPathClosure({ [weak self] _, indexPath in
            switch indexPath.row {
                case 0:
                    self?.navigationController?.pushViewController(ScrollViewController(), animated: true)
                case 1:
                    self?.navigationController?.pushViewController(TableViewController(), animated: true)
                case 2:
                    self?.navigationController?.pushViewController(CollectionViewController(), animated: true)
                default:
                    print("unknown indexPath:\(indexPath)")
            }
        })

        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())

        tableView.delegate = tableViewManager
        tableView.dataSource = tableViewManager

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

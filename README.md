# FZClosureScrollView

[![CI Status](https://img.shields.io/travis/FranZhou/FZClosureScrollView.svg?style=flat)](https://travis-ci.org/FranZhou/FZClosureScrollView)
[![Version](https://img.shields.io/cocoapods/v/FZClosureScrollView.svg?style=flat)](https://cocoapods.org/pods/FZClosureScrollView)
[![License](https://img.shields.io/cocoapods/l/FZClosureScrollView.svg?style=flat)](https://cocoapods.org/pods/FZClosureScrollView)
[![Platform](https://img.shields.io/cocoapods/p/FZClosureScrollView.svg?style=flat)](https://cocoapods.org/pods/FZClosureScrollView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Use Guide


UIScrollView delegate:
```
import FZClosureScrollView

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
    manager.delegateDecorator?.setScrollViewDidScrollClosure({ scrollView in
            print("ScrollViewDidScroll")
        }).setScrollViewDidZoomClosure({ scrollView in
            print("ScrollViewDidZoom")
        }).setScrollViewDidEndDraggingClosure({ scrollView, decelerate in
            print("ScrollViewDidEndDragging \(decelerate)")
        })

    return manager
}()
```

UITableView delegate & dataSource:
```
import FZClosureScrollView

lazy var manager: FZTableViewManager = {
    let manager = FZTableViewManager()

    manager.tableViewDelegateDecorator = FZTableViewDelegateDecorator()

    // scrollView delegate
    manager.tableViewDelegateDecorator?.setScrollViewDidScrollClosure({ _ in
            print("TableViewDidScrollClosure")
        })

    // tableView delegate
    manager.tableViewDelegateDecorator?.setTableViewDidSelectRowAtIndexPathClosure({ [weak self] tableView, indexPath in
            print("DidSelectRowAtIndexPath:\(indexPath)")
        })

    // tableView dataSource
    manager.dataSourceDecorator = FZTableViewDataSourceDecorator()
    manager.dataSourceDecorator?.setTableViewNumberOfRowsInSectionClosure({ tableView, section in
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
```

UICollectionView delegate & dataSource:
```
lazy var manager: FZCollectionViewManager = {
    let manager = FZCollectionViewManager()

    // delegate
    manager.collectionViewDelegateDecorator = FZCollectionViewDelegateDecorator()

    manager.collectionViewDelegateDecorator?.setCollectionViewDidSelectItemAtIndexPathClosure({ collectionView, indexPath in
        print("CollectionViewDidSelectItemAtIndexPath:\(indexPath)")
    })

    // dataSource
    manager.dataSourceDecorator = FZCollectionViewDataSourceDecorator()

    manager.dataSourceDecorator?.setCollectionViewNumberOfItemsInSectionClosure({ collectionView, section in
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
```

## Installation

FZClosureScrollView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FZClosureScrollView'
or
pof 'FZClosureScrollView/ScrollView'
pof 'FZClosureScrollView/TableView'
pof 'FZClosureScrollView/CollectionView'
```

## Author

Fran, fairytale_zf@outlook.com

## License

FZClosureScrollView is available under the MIT license. See the LICENSE file for more info.

//
//  PropertyListViewController.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 18/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PropertyListViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var premiumSwitch: UISwitch!
    
    var viewModel: PropertyListViewModel?
    fileprivate let disposeBag = DisposeBag()

    var detailViewController: PropertyDetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configViewModel()
        setupBinds()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func setupUI() {
        tableview.estimatedRowHeight = 400
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.register(PropertyListTableviewCell.nib(), forCellReuseIdentifier: PropertyListTableviewCell.reuseId())
    }
    
    fileprivate func configViewModel() {
        let premiumSwitchObservable = premiumSwitch.rx.isOn.asObservable()
        viewModel = PropertyListViewModel(ApiClient(), isPremium: premiumSwitchObservable)
    }
    
    fileprivate func setupBinds() {
        
        // MARK: subscriben on output propertyCount, NavigationBar title is the title of PropertyCount
        viewModel?.propertyCount.asObservable().subscribe(onNext: { count in
            self.title = count.titleForPropertyCount()
        }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)

        // MARK: bind properties data to UITableviewcell
        viewModel?.propertyArray.asObservable()
            .bind(to: tableview.rx.items(cellIdentifier: PropertyListTableviewCell.reuseId(), cellType: PropertyListTableviewCell.self)) { (row, element, cell) in
                cell.configureCell(PropertyDisplayModel(element))
            }
            .disposed(by: disposeBag)
        
        tableview.rx.itemSelected
            .subscribe(onNext: { indexPath in
                let property = self.viewModel?.propertyWithIndex(indexPath)
                if let split = self.splitViewController {
                    if let detailViewController = self.detailViewController,
                        let detailNavigationController = detailViewController.navigationController {
                        detailViewController.property = PropertyDisplayModel(property)
                        split.showDetailViewController(detailNavigationController, sender: nil)
                    }
                }
            }).disposed(by: disposeBag)
    }
}


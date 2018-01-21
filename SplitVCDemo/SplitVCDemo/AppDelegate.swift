//
//  AppDelegate.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 18/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let splitViewController = window?.rootViewController as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let masterViewController = leftNavController.topViewController as? PropertyListViewController,
            let rightNavController = splitViewController.viewControllers.last as? UINavigationController,
            let detailViewController = rightNavController.topViewController as? PropertyDetailViewController
            else { fatalError() }
        
        if let firstProperty = masterViewController.viewModel?.propertyArray.value.first {
            detailViewController.property = PropertyDisplayModel(firstProperty)
        }
        masterViewController.detailViewController = detailViewController
        
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem

        return true
    }
}


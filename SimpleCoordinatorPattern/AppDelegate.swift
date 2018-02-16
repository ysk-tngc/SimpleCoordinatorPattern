//
//  AppDelegate.swift
//  SimpleCoordinatorPattern
//
//  Created by Yusuke Taniguchi on 2018/02/15.
//  Copyright © 2018年 Yusuke Taniguchi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var firstCoordinator: FirstCoordinator!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // いつもどおり Window と RootViewController を用意する
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootNavigationController = UINavigationController()
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        // 最初の Coordinator を start
        let firstCoordinator = FirstCoordinator(navigationController: rootNavigationController)
        firstCoordinator.start()
        
        self.firstCoordinator = firstCoordinator
        self.window = window
        
        return true
    }

}


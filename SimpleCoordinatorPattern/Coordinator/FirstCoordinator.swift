//
//  FirstCoordinator.swift
//  SimpleCoordinatorPattern
//
//  Created by Yusuke Taniguchi on 2018/02/15.
//  Copyright © 2018年 Yusuke Taniguchi. All rights reserved.
//

import UIKit

final class FirstCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = UIStoryboard(name: "First", bundle: nil)
            .instantiateInitialViewController() as! FirstViewController
        vc.delegate = self
        navigationController.show(vc, sender: nil)
    }
    
}

extension FirstCoordinator: FirstViewControllerDelegate {
    func firstViewController(_ firstViewController: FirstViewController,
                             didTap action: FirstViewController.Action) {
        switch action {
        case .next:
            let nextCoordinator = SecondCoordinator(parentViewController: navigationController)
            addChildCoordinator(nextCoordinator)
            nextCoordinator.start()
        }
    }
}

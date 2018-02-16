//
//  SecondCoordinator.swift
//  SimpleCoordinatorPattern
//
//  Created by Yusuke Taniguchi on 2018/02/15.
//  Copyright © 2018年 Yusuke Taniguchi. All rights reserved.
//

import UIKit

final class SecondCoordinator: Coordinator {
    
    private let parentViewController: UIViewController
    private var navigationController: UINavigationController!
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
    
    override func start() {
        let vc = UIStoryboard(name: "Second", bundle: nil)
            .instantiateInitialViewController() as! SecondViewController
        vc.delegate = self
        
        let navigationVC = UINavigationController(rootViewController: vc)
        parentViewController.present(navigationVC, animated: true, completion: nil)
        
        self.navigationController = navigationVC
    }
    
}

extension SecondCoordinator: SecondViewControllerDelegate {
    func secondViewController(_ secondViewController: SecondViewController,
                              didTap action: SecondViewController.Action) {
        switch action {
        case .close:
            self.navigationController.dismiss(animated: true, completion: { [weak self] in
                self?.finish()
            })
        }
    }
}

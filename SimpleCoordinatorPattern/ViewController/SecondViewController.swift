//
//  SecondViewController.swift
//  SimpleCoordinatorPattern
//
//  Created by Yusuke Taniguchi on 2018/02/15.
//  Copyright © 2018年 Yusuke Taniguchi. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func secondViewController(_ secondViewController: SecondViewController,
                              didTap action: SecondViewController.Action)
}

final class SecondViewController: UIViewController {
    
    var viewModel: SecondViewModel!
    weak var delegate: SecondViewControllerDelegate?
    
    enum Action {
        case close
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Second"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done,
                                                           target: self,
                                                           action: #selector(closeButtonTapped(_:)))
    }
    
    @objc private func closeButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.secondViewController(self, didTap: .close)
    }
    
}

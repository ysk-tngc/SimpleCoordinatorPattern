//
//  ViewController.swift
//  SimpleCoordinatorPattern
//
//  Created by Yusuke Taniguchi on 2018/02/15.
//  Copyright © 2018年 Yusuke Taniguchi. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate: class {
    func firstViewController(_ firstViewController: FirstViewController,
                             didTap action: FirstViewController.Action)
}

final class FirstViewController: UIViewController {

    enum Action {
        case next
    }
    
    var viewModel: FirstViewModel!
    weak var delegate: FirstViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "First"
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        delegate?.firstViewController(self, didTap: .next)
    }
    
}

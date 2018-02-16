//
//  Coordinator.swift
//  SimpleCoordinatorPattern
//
//  Created by Yusuke Taniguchi on 2018/02/15.
//  Copyright © 2018年 Yusuke Taniguchi. All rights reserved.
//

class Coordinator {
    
    // 親 Coordinator
    private(set) weak var parentCoodinator: Coordinator?
    // 子 Coordinator
    private(set) var childCoordinators: [Coordinator] = []
    
    /// Coordinator をスタート (画面遷移処理)
    /// 子クラスで必ず override する
    func start() {
        fatalError("This method must be overrided.")
    }
    
    /// Coordinator を終了
    func finish() {
        removeFromParentCoodinator()
    }
    
    /// 次の Coordinator を childCoordinators に格納
    ///
    /// - Parameter childCoordinator: 次の Coordinator
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
        childCoordinator.parentCoodinator = self
    }
    
    /// 自身を親から削除する
    private func removeFromParentCoodinator() {
        guard let parent = parentCoodinator else { return }
        
        for (index, element) in parent.childCoordinators.enumerated() {
            if element === self {
                parent.childCoordinators.remove(at: index)
                break
            }
        }
    }
}

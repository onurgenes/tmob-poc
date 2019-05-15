//
//  SplashCoordinator.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

final class SplashCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
        childCoordinators = []
    }
    
    func start() {
        let vc = SplashVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinish() {
        guard let parentCoordinator = parentCoordinator as? AppCoordinator else { return }
        parentCoordinator.didFinishSplash(coordinator: self)
    }
}

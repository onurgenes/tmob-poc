//
//  App.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

let app = AppCoordinator()

class AppCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var window: UIWindow
    
    init() {
        window = UIWindow()
        navigationController = UINavigationController()
        childCoordinators = []
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let splashCoordinator = SplashCoordinator()
        splashCoordinator.parentCoordinator = self
        childCoordinators.append(splashCoordinator)
        window.rootViewController = splashCoordinator.navigationController
        splashCoordinator.start()
    }
    
    func didFinishSplash(coordinator: Coordinator) {
        removeChild(coordinator: coordinator)
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.parentCoordinator = self
        childCoordinators.append(mainCoordinator)
        window.rootViewController = navigationController
        mainCoordinator.start()
    }
}

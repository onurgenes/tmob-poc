//
//  MainCoordinator.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {
        let vc = MainVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openPlaces(model: NearbyModel) {
        let placesCoordinator = PlacesCoordinator(navigationController: navigationController)
        placesCoordinator.parentCoordinator = self
        placesCoordinator.model = model
        self.childCoordinators.append(placesCoordinator)
        placesCoordinator.start()
    }
}

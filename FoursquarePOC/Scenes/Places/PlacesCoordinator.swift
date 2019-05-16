//
//  PlacesCoordinator.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

final class PlacesCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    var model: NearbyModel?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {
        let placesVC = PlacesVC()
        placesVC.coordinator = self
        placesVC.model = self.model
        navigationController.delegate = self
        navigationController.pushViewController(placesVC, animated: true)
    }
    
    func openDetail() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
    
    func finishedDetail(coordinator: Coordinator) {
        removeChild(coordinator: coordinator)
    }
    
    // For Back Navigation Button
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        guard fromViewController is PlacesVC else { return }
        guard let parentCoordinator = parentCoordinator as? MainCoordinator else { return }
        parentCoordinator.removeChild(coordinator: self)
    }
}

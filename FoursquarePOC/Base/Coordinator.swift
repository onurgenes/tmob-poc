//
//  Coordinator.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
    func removeChild(coordinator: Coordinator)
}

extension Coordinator {
    func removeChild(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0 !== coordinator })
    }
}

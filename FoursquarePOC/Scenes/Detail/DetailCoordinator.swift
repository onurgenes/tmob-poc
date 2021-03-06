//
//  DetailCoordinator.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

final class DetailCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var locationLat: Double?
    var locationLon: Double?
    var model: VenueDetail?
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {
        let vc = DetailVC()
        vc.lat = locationLat
        vc.lon = locationLon
        vc.model = model
        navigationController.present(vc, animated: true)
    }
}

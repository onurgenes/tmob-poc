//
//  MainVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

final class MainVC: BaseVC<MainVM, MainView, MainCoordinator> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))
    }
    
    @objc func tapped(_ recognizor: UITapGestureRecognizer) {
        if let coordinator = coordinator {
            coordinator.openPlaces()
        }
    }
}

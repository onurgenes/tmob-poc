//
//  SplashVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

final class SplashVC: BaseVC<SplashVM, SplashView, SplashCoordinator> {
    
    private let waitingTime: TimeInterval = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + waitingTime) {
            self.coordinator?.didFinish()
        }
    }
    
}

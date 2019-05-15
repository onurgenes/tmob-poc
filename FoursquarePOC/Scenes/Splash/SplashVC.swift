//
//  SplashVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

final class SplashVC: BaseVC<SplashVM, SplashView, SplashCoordinator> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            print("finished")
            self.coordinator?.didFinish()
        }
    }
    
}

extension SplashVC: SplashVMOutputProtocol {
    
}

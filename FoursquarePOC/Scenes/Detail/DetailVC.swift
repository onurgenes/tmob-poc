//
//  DetailVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

class DetailVC: BaseVC<DetailVM, DetailView, DetailCoordinator> {
    
    // for image download: prefix + "500x300" + suffix
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension DetailVC: DetailVMOutputProtocol {
    
}

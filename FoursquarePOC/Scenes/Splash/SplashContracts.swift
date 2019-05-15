//
//  SplashContracts.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

protocol SplashVMProtocol: BaseVMProtocol {
    var delegate: SplashVMOutputProtocol? { get set }
    
}

protocol SplashVMOutputProtocol: BaseVMOutputProtocol {
    
}

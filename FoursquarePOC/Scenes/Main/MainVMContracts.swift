//
//  MainVMContracts.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

protocol MainVMProtocol: BaseVMProtocol {
    var delegate: MainVMOutputProtocol? { get set }
}

protocol MainVMOutputProtocol: BaseVMOutputProtocol {
    
}

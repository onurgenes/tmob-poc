//
//  PlacesContracts.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

protocol PlacesVMProtocol: BaseVMProtocol {
    var delegate: PlacesVMOutputProtocol? { get set }
}

protocol PlacesVMOutputProtocol: BaseVMOutputProtocol {
    
}

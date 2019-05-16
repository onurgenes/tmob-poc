//
//  MainVM.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

final class MainVM: MainVMProtocol {
    weak var delegate: MainVMOutputProtocol?
    fileprivate let networkManager = NetworkManager()
    
    func getNearbyPlaces(for locationName: String, type: String) {
        networkManager.getNearby(for: locationName, type: type) { result in
            switch result {
            case .failure(let err):
                self.delegate?.failedGetNearby(error: err)
            case .success(let model):
                self.delegate?.didGetNearby(places: model)
            }
        }
    }
}

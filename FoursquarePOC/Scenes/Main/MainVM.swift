//
//  MainVM.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation
import SwiftLocation

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
    
    func getNearbyPlacesWithCoordinates(type: String) {
        
        // I have used this for getting user location without asking permission.
        // Hacky way but it works for development purposes.
        // This basically gets user's location with GEO IP.
        Locator.currentPosition(usingIP: .ipApi, onSuccess: { (location) -> (Void) in
            DispatchQueue.main.async {
                self.networkManager.getNearbyWith(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude, type: type) { result in
                    switch result {
                    case .failure(let err):
                        self.delegate?.failedGetNearby(error: err)
                    case .success(let model):
                        self.delegate?.didGetNearby(places: model)
                    }
                }
            }
            
        }) { (error, location) -> (Void) in
            self.delegate?.failedGetNearby(error: error)
        }
    }
}

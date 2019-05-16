//
//  PlacesVM.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

final class PlacesVM: PlacesVMProtocol {
    weak var delegate: PlacesVMOutputProtocol?
    fileprivate let networkManager = NetworkManager()
    
    func getVenueDetails(id: String) {
        networkManager.getDetailsOfVenue(id: id) { (result) in
            switch result {
            case .failure(let err):
                self.delegate?.failedGetVenueDetails(error: err)
            case .success(let val):
                self.delegate?.didGetVenueDetails(details: val)
            }
        }
    }
}

//
//  Networkable.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation
import Moya

protocol Networkable: AnyObject {
    var provider: MoyaProvider<FoursquareAPI> { get set }
    
    func getNearby(for locationName: String, type: String, completion: @escaping (Result<NearbyModel, Error>) -> ())
    func getDetailsOfVenue(id: String, completion: @escaping (Result<VenueDetail, Error>) -> ())
}

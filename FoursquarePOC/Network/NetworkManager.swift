//
//  NetworkManager.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation
import Moya

class NetworkManager: Networkable {
    var provider = MoyaProvider<FoursquareAPI>(plugins: [NetworkLoggerPlugin(verbose: true),
                                                         NetworkActivityPlugin(networkActivityClosure: { (changeType, targetType) in
                                                            UIApplication.shared.isNetworkActivityIndicatorVisible = (changeType == .began)
                                                        })
        ])
    
    func getNearby(for locationName: String, type: String, completion: @escaping (Result<NearbyModel, Error>) -> ()) {
        provider.request(.getNearbyPlaces(locationName: locationName, type: type)) { (result) in
            switch result {
            case .failure(let err):
                completion(.failure(err))
            case .success(let val):
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(NearbyModel.self, from: val.data)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

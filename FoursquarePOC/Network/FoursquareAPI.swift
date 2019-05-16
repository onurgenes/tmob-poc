//
//  FoursquareAPI.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation
import Moya

enum FoursquareAPI {
    case getNearbyPlaces(locationName: String, type: String)
    case getVenueDetails(id: String)
}

// ** MOYA **
// You can read the details about this framework at my website: https://devgenes.com/posts/moya-as-network-layer-with-codable
//************
extension FoursquareAPI: TargetType {
    var baseURL: URL {
        // This is OK to use bang operator because we don't want to run if URL is not valid
        return URL(string: "https://api.foursquare.com/v2")!
    }
    
    var path: String {
        switch self {
        case .getNearbyPlaces:
            return "/venues/search"
        case .getVenueDetails(let id):
            return "/venues/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNearbyPlaces:
            return .get
        case .getVenueDetails:
            return .get
        }
    }
    
    var sampleData: Data {
        // I won't add any tests for now.
        return Data()
    }
    
    var task: Task {
        // We shouldn't keep API Keys in code but this is for development purposes
        var params: [String: Any] = ["client_id": "YAQHLMXNJJZYWETJHIXGBXLF44NY5RPMGTSZ3HPF1OHD1BN3",
                                     "client_secret": "AYT0XBMK1JC4LNM3IB0RSXS2AXIWPMZJ54GFZ2BEI13L15KV",
                                     "v": "20190425"]
        
        switch self {
        case .getNearbyPlaces(let locationName, let type):
            params["near"] = locationName
            params["intent"] = "browse"
            params["limit"] = 20
            params["radius"] = 5000
            params["query"] = type
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getVenueDetails:
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

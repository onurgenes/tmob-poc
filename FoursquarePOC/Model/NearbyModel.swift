//
//  NearbyModel.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

// ***
// This model does NOT cover all fields of response.
// For demo purposes, we are covering as little as we want.
// ***

struct NearbyModel: Codable {
    let meta: Meta
    let response: Response
}

struct Meta: Codable {
    let code: Int
    let requestID: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

struct Response: Codable {
    let venues: [Venue]
    let geocode: Geocode
}

struct Geocode: Codable {
    let what, geocodeWhere: String
    
    enum CodingKeys: String, CodingKey {
        case what
        case geocodeWhere = "where"
    }
}

struct Venue: Codable {
    let id, name: String
    let location: Location
    let hasPerk: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, location, hasPerk
    }
}

struct Location: Codable {
    let lat, lng: Double
    let labeledLatLngs: [LabeledLatLng]?
    let formattedAddress: [String]
    let country: String
    let address, city, state, postalCode: String?
    let crossStreet, neighborhood: String?
}

struct LabeledLatLng: Codable {
    let label: String
    let lat, lng: Double
}

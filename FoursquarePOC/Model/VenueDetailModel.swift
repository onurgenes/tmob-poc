//
//  VenueDetailModel.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import Foundation

// ***
// This model does NOT cover all fields of response.
// For demo purposes, we are covering as little as we want.
// Generated with https://app.quicktype.io/
// ***
// To parse the JSON, add this file to your project and do:
//
//   let venueDetail = try? newJSONDecoder().decode(VenueDetail.self, from: jsonData)

import Foundation

struct VenueDetail: Codable {
    let meta: Meta
    let response: DetailResponse
}

struct DetailMeta: Codable {
    let code: Int
    let requestID: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

struct DetailResponse: Codable {
    let venue: ResponseVenue
}

struct ResponseVenue: Codable {
    let id, name: String
    let location: DetailLocation
    let canonicalURL: String
    let shortURL: String
    let bestPhoto: BestPhotoClass
    
    enum CodingKeys: String, CodingKey {
        case id, name, location
        case canonicalURL = "canonicalUrl"
        case shortURL = "shortUrl"
        case bestPhoto
    }
}

struct BestPhotoClass: Codable {
    let id: String
    let createdAt: Int
    let source: Source?
    let photoPrefix: String
    let suffix: String
    let width, height: Int
    let visibility: String
    let user: BestPhotoUser?
    
    enum CodingKeys: String, CodingKey {
        case id, createdAt, source
        case photoPrefix = "prefix"
        case suffix, width, height, visibility, user
    }
}

struct Source: Codable {
    let name: String
    let url: String
}

struct BestPhotoUser: Codable {
    let id, firstName: String
    let lastName: String?
    let gender: String
    let photo: IconClass
    let type: String?
}

struct IconClass: Codable {
    let photoPrefix: String
    let suffix: String
    
    enum CodingKeys: String, CodingKey {
        case photoPrefix = "prefix"
        case suffix
    }
}


struct DetailLocation: Codable {
    let address, crossStreet: String
    let lat, lng: Double
    let labeledLatLngs: [DetailLabeledLatLng]
    let cc, city, state, country: String
    let formattedAddress: [String]
}

struct DetailLabeledLatLng: Codable {
    let label: String
    let lat, lng: Double
}

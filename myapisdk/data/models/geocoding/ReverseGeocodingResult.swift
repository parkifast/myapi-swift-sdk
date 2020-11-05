//
//  ReverseGeocodingResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 22/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
* Represents a single result of a Reverse Geocoding API response.
*/
public struct ReverseGeocodingResult: Codable {
    
    /**
     Information about current place and element in OSM cartography.
     */
    var osmPlaceInfo: OSMPlaceInfo?
    
    /**
     Coordinate associated to the address queried for direct geocoding.
     */
    var coordinate: Coordinate?
    
    /**
     Bounding box containing the found coordinate.
     */
    var boundingBox: BoundingBox?
    
    /**
     Complex address structure representing full address.
     */
    var addressDetails: AddressDetails?
    
    /**
     Fully built address of found cooordinate.
     */
    var fullAddress: String?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case boundingBox = "boundingbox"
        case addressDetails = "address"
        case fullAddress = "display_name"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let reverseGeocodingResult = try decoder.container(keyedBy: ReverseGeocodingResult.CodingKeys.self)
        osmPlaceInfo = try OSMPlaceInfo(from: decoder)
        coordinate = try Coordinate(from: decoder)
        boundingBox = try reverseGeocodingResult.decodeIfPresent(BoundingBox.self, forKey: .boundingBox)
        addressDetails = try reverseGeocodingResult.decodeIfPresent(AddressDetails.self, forKey: .addressDetails)
        fullAddress = try reverseGeocodingResult.decodeIfPresent(String.self, forKey: .fullAddress)
    }
    
}

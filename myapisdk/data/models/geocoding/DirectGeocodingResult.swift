//
//  DirectGeocodingResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 17/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Direct Geocoding API response.
 */
public struct DirectGeocodingResult: Codable {
    
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
     Fully built address of found coordinate.
     */
    var fullAddress: String?
    
    /**
     Type of place found.
     */
    var type: String?
    
    /**
     Subtype of place found.
     */
    var subtype: String?
    
    /**
     Importance / relevance of the place found related to the query.
     */
    var importance: Double?
    
    /**
     Distance to source in kilometers. Only available when source_lat and source_lon are used in the request.
     */
    var distToSource: Double?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case boundingBox = "boundingbox"
        case fullAddress = "display_name"
        case type = "class"
        case subtype = "type"
        case importance
        case distToSource = "distance_to_source"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let directGeocodingResult = try decoder.container(keyedBy: DirectGeocodingResult.CodingKeys.self)
        osmPlaceInfo = try OSMPlaceInfo(from: decoder)
        coordinate = try Coordinate(from: decoder)
        boundingBox = try directGeocodingResult.decodeIfPresent(BoundingBox.self, forKey: .boundingBox)
        fullAddress = try directGeocodingResult.decodeIfPresent(String.self, forKey: .fullAddress)
        type = try directGeocodingResult.decodeIfPresent(String.self, forKey: .type)
        subtype = try directGeocodingResult.decodeIfPresent(String.self, forKey: .subtype)
        importance = try directGeocodingResult.decodeIfPresent(Double.self, forKey: .importance)
        distToSource = try directGeocodingResult.decodeIfPresent(Double.self, forKey: .distToSource)
    }
}

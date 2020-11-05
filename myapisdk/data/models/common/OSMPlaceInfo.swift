//
//  OSMPlaceInfo.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 17/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Basic standard information about a specific OSM Place.
 */
public struct OSMPlaceInfo: Codable {
    
    /**
     Legal licence under which this data might be used.
     */
    var licence: String
    
    /**
     Unique identifier for current place.
     */
    var placeId: String
    
    /**
     Type of OSM element (way, node or relation).
     */
    var osmType: String
    
    /**
     Unique identifier for current OSM element.
     */
    var osmId: String
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case licence
        case placeId = "place_id"
        case osmType = "osm_type"
        case osmId = "osm_id"
    }
}

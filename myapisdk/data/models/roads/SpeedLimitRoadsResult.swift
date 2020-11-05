//
//  SpeedLimitRoadsResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Speed Limit Roads API response.
 */
public struct SpeedLimitRoadsResult: Codable {
    
    /**
     Information about current place and element in OSM cartography.
     */
    var osmPlaceInfo: OSMPlaceInfo?
    
    /**
     The queried road max speed in kilometers per hour.
     */
    var maxSpeed: Int?
    
    /**
     The queried road highway type.
     */
    var highwayType: String?
    
    /**
     The queried road name.
     */
    var name: String?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case maxSpeed = "maxspeed"
        case highwayType = "highway"
        case name
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let speedLimitRoadsResult = try decoder.container(keyedBy: SpeedLimitRoadsResult.CodingKeys.self)
        let maxSpeedStr = try speedLimitRoadsResult.decodeIfPresent(String.self, forKey: .maxSpeed)
        if maxSpeedStr != nil {
            maxSpeed = Int(maxSpeedStr!)
        }
        highwayType = try speedLimitRoadsResult.decodeIfPresent(String.self, forKey: .highwayType)
        name = try speedLimitRoadsResult.decodeIfPresent(String.self, forKey: .name)
    }
}

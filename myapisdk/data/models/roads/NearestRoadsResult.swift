//
//  NearestRoadsResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Nearest Roads API response.
 */
public struct NearestRoadsResult: Codable {
    
    /**
     The distance in meters between the provided `Coordinate` and the snapped one to the nearest road.
     */
    var distance: Double?
    
    /**
     The coordinate snapped to nearest road.
     */
    var snappedCoordinate: Coordinate?
    
    /**
     The queried road highway type.
     */
    var highwayType: String?
    
    /**
     The number of lanes this road has.
     */
    var lanes: Int?
    
    /**
     The max speed for this road segment, if available.
     */
    var maxSpeed: Int?
    
    /**
     The road name.
     */
    var name: String?
    
    /**
     Whether the road is one way or not.
     */
    var oneWay: Bool?
    
    /**
     The road reference.
     */
    var ref: String?
    
    /**
     The road reference color.
     */
    var refColor: String?
    
    /**
     NOTE: We may add additional descriptive fields to the response without issuing a new API version. All those potentially different fields will be found under this key-value structure.
     */
    var components: [String: Any]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case distance
        case highwayType = "highway"
        case lanes
        case maxSpeed = "maxspeed"
        case name
        case oneWay = "oneway"
        case ref
        case refColor = "ref:colour"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let nearestRoadsResult = try decoder.container(keyedBy: NearestRoadsResult.CodingKeys.self)
        distance = try nearestRoadsResult.decodeIfPresent(Double.self, forKey: .distance)
        snappedCoordinate = try Coordinate(from: decoder)
        highwayType = try nearestRoadsResult.decodeIfPresent(String.self, forKey: .highwayType)
        let lanesStr = try nearestRoadsResult.decodeIfPresent(String.self, forKey: .lanes)
        if lanesStr != nil {
            lanes = Int(lanesStr!)
        }
        let maxSpeedStr = try nearestRoadsResult.decodeIfPresent(String.self, forKey: .maxSpeed)
        if maxSpeedStr != nil {
            maxSpeed = Int(maxSpeedStr!)
        }
        name = try nearestRoadsResult.decodeIfPresent(String.self, forKey: .name)
        oneWay = try nearestRoadsResult.decodeIfPresent(String.self, forKey: .oneWay) == "yes"
        ref = try nearestRoadsResult.decodeIfPresent(String.self, forKey: .ref)
        refColor = try nearestRoadsResult.decodeIfPresent(String.self, forKey: .refColor)
        components = [:]
        for key in nearestRoadsResult.allKeys {
            if let boolValue = try? nearestRoadsResult.decode(Bool.self, forKey: key) {
                components![key.stringValue] = boolValue
            } else if let stringValue = try? nearestRoadsResult.decode(String.self, forKey: key) {
                components![key.stringValue] = stringValue
            } else if let intValue = try? nearestRoadsResult.decode(Int.self, forKey: key) {
                components![key.stringValue] = intValue
            } else if let doubleValue = try? nearestRoadsResult.decode(Double.self, forKey: key) {
                components![key.stringValue] = doubleValue
            }
        }
    }
    
}

//
//  Route.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a deserialized route calculated in myapi servers.
 */
public struct Route: Codable {
    
    /**
     Collection of `RouteLeg`s that conform the full `Route`. A `RouteLeg` is the route segment between to waypoints (also origin and / or destination).
     */
    var legs: [RouteLeg]?
    
    /**
     The calculated weight of the `Route`.
     */
    var weight: Double?
    
    /**
     The name of the weight profile used during extraction phase.
     */
    var weightName: String?
    
    /**
     The total estimated travel time, in seconds.
     */
    var duration: Double?
    
    /**
     The distance traveled by the route, in meters.
     */
    var distance: Double?
    
    /**
     The whole geometry of the route value depending on overview parameter, format depending on the parameter geometries.
     */
    var geometry: Geometry?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case legs
        case weight
        case weightName = "weight_name"
        case duration
        case distance
        case geometry
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let route = try decoder.container(keyedBy: Route.CodingKeys.self)
        legs = try route.decodeIfPresent([RouteLeg].self, forKey: .legs)
        weight = try route.decodeIfPresent(Double.self, forKey: .weight)
        weightName = try route.decodeIfPresent(String.self, forKey: .weightName)
        duration = try route.decodeIfPresent(Double.self, forKey: .duration)
        distance = try route.decodeIfPresent(Double.self, forKey: .distance)
        geometry = try route.decodeIfPresent(Geometry.self, forKey: .geometry)
    }
}

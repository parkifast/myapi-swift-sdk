//
//  RouteLeg.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a route between two `RouteWaypoint`s.
 */
public struct RouteLeg: Codable {
    
    /**
     Collection of `RouteStep`s that conform the full `RouteLeg`. A `RouteStep` is the specific maneuver segments between two points in the road segment where the driver needs to make a decision.
     */
    var steps: [RouteStep]?
    
    /**
     The calculated weight of the `RouteLeg`.
     */
    var weight: Double?
    
    /**
     Summary of the route taken as string. Depends on the summary parameter.
     
     **true:** Names of the two major roads used. Can be empty if route is too short.
     
     **false:** Empty string.
     */
    var summary: String?
    
    /**
     The total estimated travel time for this leg, in seconds.
     */
    var duration: Double?
    
    /**
     The distance traveled by the leg, in meters.
     */
    var distance: Double?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case steps
        case weight
        case summary
        case duration
        case distance
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let routeLeg = try decoder.container(keyedBy: RouteLeg.CodingKeys.self)
        steps = try routeLeg.decodeIfPresent([RouteStep].self, forKey: .steps)
        weight = try routeLeg.decodeIfPresent(Double.self, forKey: .weight)
        summary = try routeLeg.decodeIfPresent(String.self, forKey: .summary)
        duration = try routeLeg.decodeIfPresent(Double.self, forKey: .duration)
        distance = try routeLeg.decodeIfPresent(Double.self, forKey: .distance)
    }
}

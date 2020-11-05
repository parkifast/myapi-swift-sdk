//
//  RouteWaypoint.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a deserialized waypoint within a calculated route. A waypoint might represent the origin, destination or any intermediate stop configured along the route.
 */
public struct RouteWaypoint: Codable {
    
    /**
     Distance from the specified waypoint to the exact `Coordinate` snapped to the road through which the route actually goes through.
     */
    var distance: Double?
    
    /**
     Name of the road the `RouteWaypoint` is in.
     */
    var name: String?
    
    /**
     Snapped coordinate to the road network calculated from the input waypoint.
     */
    var coordinate: Coordinate?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case distance
        case name
        case coordinate = "location"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let routeWaypoint = try decoder.container(keyedBy: RouteWaypoint.CodingKeys.self)
        distance = try routeWaypoint.decodeIfPresent(Double.self, forKey: .distance)
        name = try routeWaypoint.decodeIfPresent(String.self, forKey: .name)
        coordinate = try routeWaypoint.decodeIfPresent(Coordinate.self, forKey: .coordinate)
    }
}

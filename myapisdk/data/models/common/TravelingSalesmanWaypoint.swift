//
//  TravelingSalesmanWaypoint.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a deserialized waypoint within a calculated route. A waypoint might represent the origin, destination or any intermediate stop configured along the route.
 */
public struct TravelingSalesmanWaypoint: Codable {
    
    /**
     Indicates the index of the current waypoint in the trip.
     */
    var waypointIndex: Int?
    
    /**
     Index to trips of the sub-trip the current waypoint was matched to.
     */
    var tripsIndex: Int?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case waypointIndex = "waypoint_index"
        case tripsIndex = "trips_index"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let travelingSalesmanWaypoint = try decoder.container(keyedBy: TravelingSalesmanWaypoint.CodingKeys.self)
        waypointIndex = try travelingSalesmanWaypoint.decodeIfPresent(Int.self, forKey: .waypointIndex)
        tripsIndex = try travelingSalesmanWaypoint.decodeIfPresent(Int.self, forKey: .tripsIndex)
    }
}

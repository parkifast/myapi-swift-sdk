//
//  TravelingSalesmanDirectionsResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Traveling Salesman Route Calculation Directions API response.
 */
public struct TravelingSalesmanDirectionsResult: Codable {
    
    /**
     Status message indicating if the traveling salesman route calculation was successful.
     */
    var code: String?
    
    /**
     The list of waypoints that the route will cover, from origin to destination passing through all specified intermediate waypoints.
     */
    var waypoints: [TravelingSalesmanWaypoint]?
    
    /**
     The list of routes that will cover the whole list of specified waypoints.
     */
    var trips: [Route]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case code
        case waypoints
        case trips
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let travelingSalesmanDirectionsResult = try decoder.container(keyedBy: TravelingSalesmanDirectionsResult.CodingKeys.self)
        code = try travelingSalesmanDirectionsResult.decodeIfPresent(String.self, forKey: .code)
        waypoints = try travelingSalesmanDirectionsResult.decodeIfPresent([TravelingSalesmanWaypoint].self, forKey: .waypoints)
        trips = try travelingSalesmanDirectionsResult.decodeIfPresent([Route].self, forKey: .trips)
    }
}

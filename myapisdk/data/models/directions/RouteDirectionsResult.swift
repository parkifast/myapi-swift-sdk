//
//  RouteDirectionsResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
* Represents a single result of a Route Calculation Directions API response.
*/
public struct RouteDirectionsResult: Codable {
    
    /**
     Status message indicating if the route calculation was successful.
     */
    var code: String?
    
    /**
     The list of waypoints that the route will cover, from origin to destination passing through all specified intermediate waypoints.
     */
    var waypoints: [RouteWaypoint]?
    
    /**
     The list of calculated routes that go through the specified list of waypoints.
     */
    var routes: [Route]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case code
        case waypoints
        case routes
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let routeDirectionsResult = try decoder.container(keyedBy: RouteDirectionsResult.CodingKeys.self)
        code = try routeDirectionsResult.decodeIfPresent(String.self, forKey: .code)
        waypoints = try routeDirectionsResult.decodeIfPresent([RouteWaypoint].self, forKey: .waypoints)
        routes = try routeDirectionsResult.decodeIfPresent([Route].self, forKey: .routes)
    }
}

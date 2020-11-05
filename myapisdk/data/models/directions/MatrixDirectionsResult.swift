//
//  MatrixDirectionsResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Matrix Directions API response.
 */
public struct MatrixDirectionsResult: Codable {
    
    /**
     Status message indicating if the matrix calculation was successful.
     */
    var code: String?
    
    /**
     The list of sources included in the route matrix calculation.
     */
    var sources: [RouteWaypoint]?
    
    /**
     The list of destinations included in the route matrix calculation.
     */
    var destinations: [RouteWaypoint]?
    
    /**
     The matrix specifying all possible durations (time travel) from each source to each destination through the fastest route possible.
     */
    var durations: RouteDurationsMatrix?
    
    /**
     The matrix specifying all possible distances (in meters) from each source to each destination through the fastest route possible.
     */
    var distances: RouteDistancesMatrix?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case code
        case sources
        case destinations
        case durations
        case distances
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let matrixDirectionsResult = try decoder.container(keyedBy: MatrixDirectionsResult.CodingKeys.self)
        code = try matrixDirectionsResult.decodeIfPresent(String.self, forKey: .code)
        sources = try matrixDirectionsResult.decodeIfPresent([RouteWaypoint].self, forKey: .sources)
        destinations = try matrixDirectionsResult.decodeIfPresent([RouteWaypoint].self, forKey: .destinations)
        durations = try RouteDurationsMatrix(from: decoder)
        distances = try RouteDistancesMatrix(from: decoder)
    }
    
}

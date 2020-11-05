//
//  TravelingSalesmanDirectionsResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Traveling Salesman Directions API Response model. The response includes the optimal route according to the input parameters in order to go through every waypoint in the least time possible.
 */
public struct TravelingSalesmanDirectionsResponse: Codable {
    
    /**
     Current API version.
     */
    var version: String?
    
    /**
     API Provider.
     */
    var provider: String?
    
    /**
     Timestamp when the request was made.
     */
    var timestamp: UInt64?
    
    /**
     Copyright information.
     */
    var copyright: String?
    
    /**
     Status message.
     */
    var status: String?
    
    /**
     Contains all information about this request's response.
     */
    var travelingSalesmanDirectionsResult: TravelingSalesmanDirectionsResult
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case travelingSalesmanDirectionsResult = "data"
    }
    
}

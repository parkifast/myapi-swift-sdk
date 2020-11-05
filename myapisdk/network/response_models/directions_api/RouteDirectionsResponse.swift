//
//  RouteDirectionsResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Route Directions API Response model. The response includes a list of calculated routes according to the specified parameters, with all necessary information for routing.
 */
public struct RouteDirectionsResponse: Codable {
    
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
    var routeDirectionsResult: RouteDirectionsResult
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case routeDirectionsResult = "data"
    }
    
}

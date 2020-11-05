//
//  DistanceRoadsResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Distance roads response model. Contains information about distance from the specified `Coordinate` to the nearest road (straight line length perpendicular to its longitudinal axis).
*/
public struct DistanceRoadsResponse: Codable {
    
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
    var distanceRoadsResult: DistanceRoadsResult
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case distanceRoadsResult = "data"
    }
    
}

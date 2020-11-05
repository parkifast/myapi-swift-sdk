//
//  HighwayTypeRoadsResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 23/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Highway type roads response model. Contains information about the type of highway the queried `Coordinate` belongs to (or is nearest to).
 */
public struct HighwayTypeRoadsResponse: Codable {
    
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
    var highwayTypeRoadsResult: HighwayTypeRoadsResult
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case highwayTypeRoadsResult = "data"
    }
    
}

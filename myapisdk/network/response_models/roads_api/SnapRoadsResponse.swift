//
//  SnapRoadsResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 23/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Snap to roads response model. Snaps the queried `Coordinate` to the nearest road.
 */
public struct SnapRoadsResponse: Codable {
    
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
    var snapRoadResult: SnapRoadsResult
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case snapRoadResult = "data"
    }
    
}

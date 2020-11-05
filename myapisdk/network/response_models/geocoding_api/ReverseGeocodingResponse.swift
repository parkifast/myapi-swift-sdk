//
//  ReverseGeocodingResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 22/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Reverse geocoding response model. Contains information about the address that the queried `Coordinate` represents.
*/
public struct ReverseGeocodingResponse: Codable {
    
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
     Reverse geocoding results values.
     */
    var reverseGeocodingResults: ReverseGeocodingResult
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case reverseGeocodingResults = "data"
    }
}

//
//  DirectGeocodingResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 17/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Direct geocoding response model. Contains information about the `Coordinate` that the queried address represents.
*/
public struct DirectGeocodingResponse: Codable {
    
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
     Direct geocoding results values.
     */
    var directGeocodingResults: [DirectGeocodingResult]
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case directGeocodingResults = "data"
    }
}


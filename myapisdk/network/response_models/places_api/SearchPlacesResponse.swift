//
//  SearchPlacesResponse.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Places API Search response model. Contains information about all nearby places that fit the request criteria.
 */
public struct SearchPlacesResponse: Codable {
    
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
     Next page results token. Specify this value in the next request as a parameter in order to retrieve the next batch of results.
     */
    var next: String?
    
    /**
     Contains all information about this request's response.
     */
    var searchPlacesResults: [SearchPlacesResult]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case version
        case provider
        case timestamp
        case copyright
        case status
        case next
        case searchPlacesResults = "data"
    }
    
}

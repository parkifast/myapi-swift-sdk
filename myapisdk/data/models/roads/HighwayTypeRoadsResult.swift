//
//  HighwayTypeRoadsResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 23/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Highway Type Roads API response.
 */
public struct HighwayTypeRoadsResult: Codable {
    
    /**
     Indicates whether the highway type retrieval was successful or not.
     */
    var success: Bool?
    
    /**
     The queried road highway type.
     */
    var highwayType: String?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case success
        case highwayType = "highway"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let highwayTypeRoadsResult = try decoder.container(keyedBy: HighwayTypeRoadsResult.CodingKeys.self)
        success = try highwayTypeRoadsResult.decodeIfPresent(String.self, forKey: .success) == "true"
        highwayType = try highwayTypeRoadsResult.decodeIfPresent(String.self, forKey: .highwayType)
    }
    
}

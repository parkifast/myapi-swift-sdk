//
//  DistanceRoadsResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Distance Roads API response.
 */
public struct DistanceRoadsResult: Codable {
    
    /**
     The distance in meters between the provided `Coordinate` and the snapped one to the nearest road.
     */
    var distance: Double?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case distance
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let distanceRoadsResult = try decoder.container(keyedBy: DistanceRoadsResult.CodingKeys.self)
        distance = try distanceRoadsResult.decodeIfPresent(Double.self, forKey: .distance)
    }
    
}

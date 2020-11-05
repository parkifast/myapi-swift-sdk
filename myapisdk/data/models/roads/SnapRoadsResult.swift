//
//  SnapRoadResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 23/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Snap Roads API response.
 */
public struct SnapRoadsResult: Codable {
    
    /**
     Coordinate snapped to the nearest road.
     */
    var coordinate: Coordinate?
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        coordinate = try Coordinate(from: decoder)
    }
}

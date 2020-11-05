//
//  BoundingBox.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 17/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a bounding box for a geographical area, expressed by its north-west coordinate (top-left corner of the box) and its south-east coordinate (bottom-right corner).
 */
public struct BoundingBox: Codable {
    
    /**
     South latitude of the bounding box.
     */
    var southLat: Double
    
    /**
     North latitude of the bounding box.
     */
    var northLat: Double
    
    /**
     West longitude of the bounding box.
     */
    var westLon: Double
    
    /**
     East longitude of the bounding box.
     */
    var eastLon: Double
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case southLat = "south_lat"
        case northLat = "north_lat"
        case westLon = "west_lon"
        case eastLon = "east_lon"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        southLat = 0.0
        northLat = 0.0
        westLon = 0.0
        eastLon = 0.0
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if container.currentIndex == 0 {
                let value = try container.decode(String.self)
                southLat = Double(value)!
            }
            if container.currentIndex == 1 {
                let value = try container.decode(String.self)
                northLat = Double(value)!
            }
            if container.currentIndex == 2 {
                let value = try container.decode(String.self)
                westLon = Double(value)!
            }
            if container.currentIndex == 3 {
                let value = try container.decode(String.self)
                eastLon = Double(value)!
            }
        }
    }
}

//
//  Coordinate.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 17/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a geographic coordinate.
 */
public struct Coordinate: Codable, CustomStringConvertible {
    
    /**
     Latitude component of the coordinate.
     */
    var lat: Double
    
    /**
     Longitude component of the coordinate.
     */
    var lon: Double
    
    /**
     Coordinate description.
     */
    public var description: String {
        return "\(lat),\(lon)"
    }
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        if let coordinate = try? decoder.container(keyedBy: Coordinate.CodingKeys.self) {
            if let latitude = try? coordinate.decode(String.self, forKey: .lat) {
                lat = Double(latitude)!
            } else {
                lat = try coordinate.decode(Double.self, forKey: .lat)
            }
            if let longitude = try? coordinate.decode(String.self, forKey: .lon) {
                lon = Double(longitude)!
            } else {
                lon = try coordinate.decode(Double.self, forKey: .lon)
            }
        } else {
            lat = 0.0
            lon = 0.0
            var container = try decoder.unkeyedContainer()
            while !container.isAtEnd {
                if container.currentIndex == 0 {
                    lon = try container.decode(Double.self)
                }
                if container.currentIndex == 1 {
                    lat = try container.decode(Double.self)
                }
            }
        }
    }
    
    /**
    Basic constructor for a `Coordinate` object.
    - Parameter lat: The latitude component.
    - Parameter lon: The longitude component.
    */
    public init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
}

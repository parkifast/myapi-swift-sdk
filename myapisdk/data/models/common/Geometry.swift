//
//  Geometry.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 28/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation
import GEOSwift

/**
 The geometry of the route segment, it's format will depend on the geometries parameter.
 
 Possibilities are:
 
 **polyline** - [Polyline](https://www.npmjs.com/package/polyline) with precision 5 in [latitude, longitude] encoding.
 
 **polyline6** - [Polyline](https://www.npmjs.com/package/polyline) with precision 6 in [latitude, longitude] encoding.
 
 **geojson** - [GeoJSON](http://geojson.org/geojson-spec.html#linestring) `LineString`.
 */
public struct Geometry: Codable {
    
    /**
     Encoded polyline with precision 5 or 6 in [latitude, longitude] depending on the parameter `geometries` in the request.
     */
    var polyline: String?
    
    /**
     Encoded in GeoJSON format, ready to use with maps such as Google Maps or Mapbox.
     */
    var geojson: GeoJSON?
    
    /**
     List of coordinates that represent the route segment. Only available when original format was GeoJSON.
     */
    var coordinates: [Coordinate]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case polyline
        case coordinates
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        if let geometry = try? decoder.container(keyedBy: Geometry.CodingKeys.self) {
            geojson = try GeoJSON(from: decoder)
            coordinates = try geometry.decodeIfPresent([Coordinate].self, forKey: .coordinates)
        } else {
            polyline = try decoder.singleValueContainer().decode(String.self)
        }
    }
}

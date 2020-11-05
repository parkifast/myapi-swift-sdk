//
//  GeometryType.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 30/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Determines the format in which the route will be sent in the response as an overview. Implemented possibilities are: encoded polyline (polyline), encoded polyline v6 (polyline6) or geoJSON(geojson).
 */
public enum GeometryType: String {
    /**
     Encoded polyline.
     */
    case polyline
    /**
     Encoded polyline v6.
     */
    case polyline6
    /**
     GeoJSON.
     */
    case geojson
}
